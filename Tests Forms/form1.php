<?php
#receive form data
if(isset($_POST["s"]))
{
    
    $Title=$_POST["Title"];
    $Desc=$_POST["Desc"];
    $QLink=$_POST["QLink"];
    $Outof=$_POST["Outof"];
    $NOQ=$_POST["NOQ"];

    #database connectivity
    $conn=new mysqli("localhost","root","","tests_db");
    if($conn->connect_error)
    die("Connection failed: ".$conn->connect_error);
else{
    $sql="select max(t_id)as m from phy_tests";
    $result=mysqli_query($conn,$sql);
    $newID=1;
    if(mysqli_num_rows($result)>0){
        while($row=mysqli_fetch_assoc($result)){
            #one row got from result
            $newID=$row["m"]+1;

        }
    }
    $sql="insert into phy_tests values($newID,'$Title','$Desc','$QLink','$Outof','$NOQ')";
   
    mysqli_query($conn,$sql);
}
}
?>
<form action='form1.php'method=POST>
    
    Title<input type=text name= Title required><BR>
    Description<input type= text name =Desc required><BR>
    QLink<input type=text name= QLink required><BR>
    Out of<input type =number name= Outof required><BR>
    No. of Questions<input type =number name= NOQ required><BR>
    <input type=hidden name=s value=1>
    <input type=submit>
</form> 