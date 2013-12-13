Imports System.Web.UI


Public Class Helpers
    ''' <summary>
    '''     This ties a textbox to a button. 
    ''' </summary>
    ''' <param name="TextBoxToTie">
    '''     This is the textbox to tie to. It doesn't have to be a TextBox control, but must be derived from either HtmlControl or WebControl,
    '''     and the html control should accept an 'onkeydown' attribute.
    ''' </param>
    ''' <param name="ButtonToTie">
    '''     This is the button to tie to. All we need from this is it's ClientID. The Html tag it renders should support click()
    ''' </param>
    ''' 
    Public Shared Sub TieButton(TextBoxToTie As Control, ButtonToTie As Control)

        Dim formName As String

        Try

            Dim i As Integer = 0

            Dim c As Control = ButtonToTie.Parent

            ' Step up the control hierarchy until either:
            ' 1) We find an HtmlForm control
            ' 2) We find a Page control - not what we want, but we should stop searching because we a Page will be higher than the HtmlForm.
            ' 3) We complete 500 iterations. Obviously we are in a loop, and should stop.

            While Not (TypeOf c Is System.Web.UI.HtmlControls.HtmlForm) And Not (TypeOf c Is System.Web.UI.Page) AndAlso i < 500

                c = c.Parent
                i += 1

            End While

            ' If we have found an HtmlForm, we use it's ClientID for the formName.
            ' If not, we use the first form on the page ("forms[0]").

            If TypeOf c Is System.Web.UI.HtmlControls.HtmlForm Then

                formName = c.ClientID

            Else

                formName = "forms[0]"

            End If

        Catch

            'If we catch an exception, we should use the first form on the page ("forms[0]").
            formName = "forms[0]"

        End Try

        ' Tie the button.
        TieButton(TextBoxToTie, ButtonToTie, formName)

    End Sub
    ''' <summary>
    '''     This ties a textbox to a button. 
    ''' </summary>
    ''' <param name="TextBoxToTie">
    '''     This is the textbox to tie to. It doesn't have to be a TextBox control, but must be derived from either HtmlControl or WebControl,
    '''     and the html control should accept an 'onkeydown' attribute.
    ''' </param>
    ''' <param name="ButtonToTie">
    '''     This is the button to tie to. All we need from this is it's ClientID. The Html tag it renders should support click()
    ''' </param>
    ''' <param name="formName">
    '''     This is the ClientID of the form that the button resides in.
    ''' </param>
    ''' 
    Public Shared Sub TieUpArrowButton(ASPButtonToTie As Control, ButtonToTie As Control, formName As String)

        ' This is our javascript - we fire the client-side click event of the button if the enter key is pressed.

        Dim jsString As String = "if ((event.which && event.which == 38) || (event.keyCode && event.keyCode == 38)) {document.getElementById('" & ButtonToTie.ClientID & "').click();return false;} else return true;"

        'return true; ";
        ' We attach this to the onkeydown attribute - we have to cater for HtmlControl or WebControl.

        If TypeOf ASPButtonToTie Is System.Web.UI.HtmlControls.HtmlControl Then

            DirectCast(ASPButtonToTie, System.Web.UI.HtmlControls.HtmlControl).Attributes.Add("onkeydown", jsString)

        ElseIf TypeOf ASPButtonToTie Is System.Web.UI.WebControls.WebControl Then

            DirectCast(ASPButtonToTie, System.Web.UI.WebControls.WebControl).Attributes.Add("onkeydown", jsString)

        Else

            ' We throw an exception if TextBoxToTie is not of type HtmlControl or WebControl.
            Throw New ArgumentException("Control ASPButton should be derived from either System.Web.UI.HtmlControls.HtmlControl or System.Web.UI.WebControls.WebControl", "ASPButtonToTie")

        End If

    End Sub




End Class
