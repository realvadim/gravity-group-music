<?php

define("DB_HOST", "localhost");
define("DB_USER", "id9366589_vadi7mir");
define("DB_PASSWORD", "letmeintolistentomusic1237");
define("DB_DATABASE", "id9366589_musicstreamingapp");

$connection = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);
if (mysqli_connect_errno()) {
  printf("Connection failed %s\n", mysqli_connect_error());
  exit();
}

$query = "SELECT * FROM playlists";
if ($result = mysqli_query($connection, $query)) {
  $i = 0;
  while ($row = mysqli_fetch_row($result)) {
    if ($i == 0) {
      echo "$row[1], $row[2]";
    } else {
      echo "*$row[1], $row[2]";
    }

    $i++;
  }

  mysqli_free_result($result);
}

mysqli_close($connection);

?>
