document.addEventListener('DOMContentLoaded', function () {
    fetchAndRenderData().then(showContentSequentially);
});

async function fetchAndRenderData() {
    try {
        const response = await fetch(`${CONFIG.API_BASE_URL}${CONFIG.ENDPOINTS.INDEX}`);
        const data = await response.json();

        createTopModelsHTML(data.slice(0, 3));
        renderModelList(data.slice(3));
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}

function createTopModelsHTML(models) {
    // 后端数据已经按分数排序：第一名是金牌(index=0)，第二名是银牌(index=1)，第三名是铜牌(index=2)
    const medals = ['gold', 'silver', 'bronze']; // 修正顺序，与后端排名对应
    const html = models.slice(0, 3).map((model, index) => `
        <div class="model-card ${medals[index]} ${medals[index] === 'gold' ? 'top-position' : ''}">
            <div class="medal-icon"></div>
            <h2>${model.name}</h2>
            <div class="score">${model.score}</div>
            <div class="source">${model.source || '来源未知'}</div>
        </div>
    `).join('');

    document.getElementById('top-models').innerHTML = html;
}

function renderModelList(models) {
    const modelList = document.getElementById('model-list');
    modelList.innerHTML = `
        <table>
            <thead>
                <tr>
                    <th>排名</th>
                    <th>模型名称</th>
                    <th>得分</th>
                </tr>
            </thead>
            <tbody>
                ${models.map((model, index) => `
                    <tr>
                        <td>${index + 4}</td>
                        <td>${model.name}</td>
                        <td>${model.score}</td>
                    </tr>
                `).join('')}
            </tbody>
        </table>
    `;
}

function showContentSequentially() {
    const elements = ['page-title', 'top-models'];
    const delays = [200, 600];

    elements.forEach((id, index) => {
        setTimeout(() => {
            document.getElementById(id).classList.add('fade-in-grow');
        }, delays[index]);
    });

    // 确保 model-list 立即可见
    document.getElementById('model-list').style.display = 'block';
}
