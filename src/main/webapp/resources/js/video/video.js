
const li = document.querySelector('video')

let loadVideo =  function(videoId, link, lprofile) {
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
            let videoresult = document.querySelector('.videoresult');
            let video = document.createElement('video');
            video.src = "/getVideo/" + link;
            video.width = 1440;
            video.controls = true
            video.controlsList = "nodownload" // 다운로드 속성 제거
            video.autoplay = true
            video.muted = true
            video.poster = "/getImage/" + lprofile;

            if (video.ended) {
                // 비디오 재생 끝나면 다 들었다는 표시하기 위해서...
                alert('학습 완료!');

            }
            console.log(video);

            videoresult.innerHTML = '';
            videoresult.appendChild(video);

        } else {z
            console.log('no 작동');
        }
        console.log("작동이 되는 건가");
    }).catch(error => console.log(error))
        .finally(() => console.log('finally'));
}