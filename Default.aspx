<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>
   
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent" >
   
   <asp:hiddenfield id="storedCurrentImage" value="0" runat="server"/>
   <asp:HiddenField ID="storedColour" Value="blue" runat="server" />
   <asp:HiddenField ID="gameType" Value="letters" runat="server" />
   <asp:HiddenField ID="imagePath" Value="~/Images/letters/" runat="server" />
   <asp:HiddenField ID="random" Value="false" runat="server" />



   <div style="float:left; width:38%;">
      
       <div style="width:100%">
           <asp:Image runat=server ImageUrl="Images/squareBlueSelected.jpg" ID="colourSelectorBlue" />
           <asp:Image runat=server ImageUrl="Images/squarePurple.jpg" ID="colourSelectorPurple" />
           <asp:Image runat=server ImageUrl="Images/squareGreen.jpg" ID="colourSelectorGreen" />
           <asp:Image runat=server ImageUrl="Images/squareRed.jpg" ID="colourSelectorRed" />
           <asp:Image runat=server ImageUrl="Images/squareYellow.jpg" ID="colourSelectorYellow" />
           <asp:Image runat=server ImageUrl="Images/squareBlack.jpg" ID="colourSelectorBlack" />
       
       </div>   

       <div style="width:100%;">
          
           <asp:ImageButton ID="ImageButtonUp" runat=server CssClass="centered button" src="Images/arrowUp.png" 
               style="height:100px; width:100px; margin-top:15px;" AlternateText="UP" onclick="ChangeColour_Click" />
       </div>

   </div>

   <div style="float:right; width:35%;">
        <div style="width:100%">
           <asp:Image runat=server ImageUrl="Images/gameSelectorLettersSelected.png" ID="gameSelectorLetters" />
           <asp:Image runat=server ImageUrl="Images/gameSelectorNumbers.png" ID="gameSelectorNumbers" />
           <asp:Image runat=server ImageUrl="Images/gameSelectorSpotsOrdered.png" ID="gameSelectorSpots" />
        </div>
        <div style="width:100%;">
           <asp:Button runat=server cssclass="centered button" 
                style="height:60px; width:170px; margin-top:15px;" Text="npad 0" onclick="GameChange_Click" />
        </div>
   </div>
       
   <div class="clear">
   </div>
   
    <p style="text-align:center">
        <asp:Image runat=server ImageUrl="Images/letters/letter_blue_a.jpg" id="mainImage"/>
   </p>

   <div class="clear">
   </div>

   <div style="float:left; width: 23%;">
        <asp:ImageButton ID="ImageButtonLeft" runat=server CssClass="centered button" src="Images/arrowLeft.png" 
               style="height:100px; width:100px; margin-top:-120px;" AlternateText="LEFT" onclick="decrementImage_Click" />
   </div>

   <div style="float: right; width: 23%;">
        <asp:ImageButton ID="ImageButtonRight" runat=server CssClass="centered button" src="Images/arrowRight.png" 
               style="height:100px; width:100px; margin-top:-120px;" AlternateText="RIGHT" onclick="incrementImage_Click" />
   </div>

    <div class="clear">
   </div>

   <div>
   <p style="text-align:center">
    <asp:ImageButton ID="ImageButtonDown" runat=server CssClass="button" src="Images/arrowDown.png" 
               style="height:100px; width:100px; " AlternateText="DOWN" />
    <img src="Images/soundIcon.png" style="height:100px; width:100px;" AlternateText="Play Sound" />
   </p>
   </div>
  
  <div class="clear">
   </div>

   <div style="float:left;">
   <asp:Button ID="RandomButton" runat=server cssclass="button" Text="SEQ" 
           style="width:100px; margin-bottom:18px;" />
   </div>


   <script type="text/javascript">
       document.addEventListener("keydown", keyDownTextField, false);

       function keyDownTextField(e) {
           var keyCode = e.keyCode;
           if (keyCode == 38) {
               alert("You hit the up key.");
               ChangeColour_Click();
           } else if (keyCode == 39) {
               alert("You hit the right key.");
           } else if (keyCode == 40) {
               alert("You hit the down key.");
           } else if (keyCode == 37) {
               alert("You hit the left key.");
           } else if (keyCode == 96) {
               alert("You hit the 0 numpad key.");
           } else {
               alert("You hit nothing useful.");
           }
       }
   
   </script>

</asp:Content>

