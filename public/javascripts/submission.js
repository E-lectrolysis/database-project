function submission() {
    let name = document.getElementById("username").value;
    let questID = document.getElementById("quest-id").value;
    let mins = "" + document.getElementById("minutes").value;
    let secs = "" + document.getElementById("seconds").value;
    let ms = "" + document.getElementById("miliseconds").value;
    let weapon = document.getElementById("weapon").value;
    let totalTime = mins + ":" + secs.padStart(2, 0) + ":" + ms.padStart(2,0);

    let sendObj = {
        "questID":questID,
        "playerName":name,
        "weapon":weapon,
        "totalTime":totalTime
    };
    let request = new XMLHttpRequest();
    console.log(sendObj);

    for(property in sendObj) {
        if(sendObj[property] === "") {
            alert("Please fill in all the blanks.");
            
            return false;
        }

    }

    request.open("POST","/quests/submit");
    request.setRequestHeader('Content-Type',"application/json");
    request.send(JSON.stringify(sendObj));

    location.reload();
    return false;
}