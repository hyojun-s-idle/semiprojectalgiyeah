<audio id="song">
    <source src="${contextPath}/resources/sounds/06. CHRISTMAS LOVE INST(Short Ver).mp3" type="audio/mp3" />
</audio>
<div class="jukeBoxDiv jukeBox">
    <div class="jukeBoxDiv">
        <div class="coverBox rotateBox pauseBox">
            <img src="${contextPath}/resources/images/J-Peter(cover).png" alt="" id="cover">
        </div>
    </div>
    <div class="jukeBoxDiv">
        <h2 class="songText songTitle">06. CHRISTMAS LOVE INST(Short Ver)</h2>
        <h3 class="songText songSinger">J-Peter</h3>
    </div>
    <div class="jukeBoxDiv">
        <input type="range" value="0" id="songProgress">
    </div>
    <div class="jukeBoxDiv">
        <button type="button" class="songBtn" id="backBtn">
            <span class="songBtnIcon material-symbols-outlined" id="backBtnIcon">
                double_arrow
            </span>
        </button>
        <button type="button" class="songBtn" id="playBtn">
            <span class="songBtnIcon material-symbols-outlined" id="playBtnIcon">
                arrow_right
            </span>
        </button>
        <button type="button" class="songBtn" id="forwBtn">
            <span class="songBtnIcon material-symbols-outlined" id="forwBtnIcon">
                double_arrow
            </span>
        </button>
    </div>
</div>