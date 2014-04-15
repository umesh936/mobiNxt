function validateSignupForm()
{
var x=document.forms["mainForm"]["fname"].value;
if (x==null || x=="")
  {
  alert("First name must be filled out");
  return false;
  }
}