let loadVideo =  function(videoId, link) {
    fetch('/video/' + videoId, {
        method: 'GET',
        headers: {
            'Accept': 'application/text'
        }
    }).then(response => {
        if (!response.ok) {
            throw new Error('로드 실패');
        } else {
            return response.text();
        }
    }).then(data => {
        // console.log(data);
        console.log(link)
        if (data) {
            let source = document.createElement('source');
            source.src = "/getVideo/" + link;
            source.type = "video/webm";

            // 새로운 비디오 소스 추가
            document.getElementById('streaming').innerHTML='';
            document.getElementById('streaming').appendChild(source);
        } else {
            console.log('no 작동');
        }
        console.log("작동이 되는 건가");
    }).catch(error => console.log(error))
        .finally(() => console.log('finally'));
}