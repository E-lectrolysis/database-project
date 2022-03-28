function submission() {
    let name = document.getElementById("username").value;
    let questID = document.getElementById("quest-id").value;
    let minutes = document.getElementById("minutes").value;
    let seconds = document.getElementById("seconds").value;
    let ms = document.getElementById("milliseconds").value;
    let weapon = document.getElementById("weapon").value;

    let sendObj = {
        "questID":questID,
        "playerName":name,
        "weapon":weapon,
        "minutes":minutes,
        "seconds":seconds,
        "ms":ms
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