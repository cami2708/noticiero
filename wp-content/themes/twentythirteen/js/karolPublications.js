var scholarRequest      = new XMLHttpRequest();
var teacherName         = "Karol";
var teacherSurname      = "Suchan";
var url = "https://www.googleapis.com/scribe/v1/research?query="+teacherName+"+"+teacherSurname+"&dataset=paper&key=AIzaSyDqVYORLCUXxSv7zneerIgC2UYMnxvPeqQ";

// Obtain the json in the url
// Open a request and then send it
// @scholarRequest.open("Method",url,boolean);
scholarRequest.open("GET",url,true);
scholarRequest.setRequestHeader("Content-Type", "application/json");

// Create an <br> HTML element
var br = document.createElement("br");

// Function for upload data requested
scholarRequest.onloadend = function(){
  // Transform the value in json to recognise it
  var googleScholarInfoPublications = JSON.parse(scholarRequest.responseText);
  
  // In this case, the json from Google Scholar has the information of Scholar in googleScholarInfoPublications.data[0].scholar
  // In the list of things I want to obtain:
  //  - The title of the publications of some teacher (googleScholarInfoPublications.data[0].scholar[i].title)
  //  - The URL of the original document (googleScholarInfoPublications.data[0].scholar[i].url)
  //  - The metadata (googleScholarInfoPublications.data[0].scholar[i].metadata)
  // If you want to check out, write this:
  // console.log(googleScholarInfoPublications.data[0].scholar);
  
  // Calling all the elements inside the class "scholar" from the last to the begining
  for (var i = googleScholarInfoPublications.data[0].scholar.length - 1; i >= 0; i--) {
    // Generate The content and that is added in the element HTML with "result" ID
    result.innerText += googleScholarInfoPublications.data[0].scholar[i].title; //display the result in an HTML element
    result.innerText += "+";
  };
  
};
// Do all the things that set before. If you don't, nothing is going to happen
scholarRequest.send(null);

