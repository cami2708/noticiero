<?php

function teacherPublication($teacherName, $teacherSurname){

	$url = "https://www.googleapis.com/scribe/v1/research?query=".$teacherName."+".$teacherSurname."&dataset=paper&key=AIzaSyDqVYORLCUXxSv7zneerIgC2UYMnxvPeqQ";

	$contents = file_get_contents($url); 
	$contents = utf8_encode($contents); 
	$results = json_decode($contents); 

	$googleScholarInfoPublications = $results->data[0]->scholar;

	for($i=count($googleScholarInfoPublications)-1; $i>=0; $i--){
		echo '<div class="'.$teacherSurname.'" id="'.$googleScholarInfoPublications[$i]->title.'">';
		echo '<a href="'.$googleScholarInfoPublications[$i]->url.'">';
		echo '<h2 class="scholarTitle">';
		echo $googleScholarInfoPublications[$i]->title;
		echo '</h2><br><p class="scholarMetadata">';
		echo $googleScholarInfoPublications[$i]->metadata;
		echo "</p></a>";
		echo "</div>";
	}

}

?>