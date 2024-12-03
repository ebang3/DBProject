<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DBMap</title>
    <style type="text/css">
        table {
            border-collaphes: collapse;
            width: 100%;
            color: #d96459;
            font-family: monospace;
            font-size: 25px;
            text-align: left;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>State</th>
            <th>Nickname</th>
            <th>Capital</th>
            <th>Size</th>
            <th>RegionID</th>
        </tr>
    </table>
    
    <?php
        $conn - mysqli_connect("localhost", "root", "bang2003", "dbmap");
        if ($conn-> connect_error) {
            die("Connection failed:". $conn-> connection_error);
        }

        $sql = "SELECT Name, Nickname, Capital, Size, RegionID FROM states";
        $result = $conn-> query($sql);

        if ($result-> num_rows > 0) {
            while ($row = $result-> fetch_assoc()) {
                echo "<tr><td>". $row["Name"] ."</td><td>". $row["Nickname"] ."</td><td>". $row["Capital"] ."</td><td>". $row["Size"] ."</td><td>". $row["RegionID"] ."</td></tr>";
            }
            echo "</table>";
        } else {
            echo "0 result";
        }

        $conn-> close();
    ?>
</body>
</html>
StateID INT PRIMARY KEY,
    Name VARCHAR(50),
    Nickname VARCHAR(50),
    Capital VARCHAR(50),
    Size INT,
    RegionID INT