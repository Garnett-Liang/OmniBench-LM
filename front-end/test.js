// 从后端获取科目列表并填充下拉菜单
// function fetchSubjects() {
//   fetch('http://10.12.173.133/test')
//       .then(response => response.json())
//       .then(subjects => {
//           const select = document.getElementById('subject');
//           subjects.forEach(subject => {
//               const option = document.createElement('option');
//               option.value = subject.id;
//               option.textContent = subject.name;
//               select.appendChild(option);
//           });
//       })
//       .catch(error => console.error('Error fetching subjects:', error));
// }

// 当类别选择发生变化时的处理函数
function handleCategoryChange() {
    const category = document.getElementById('category').name;
    console.log('Selected category:', category);
    // 这里可以添加更多的逻辑,例如根据选择的类别更新页面内容
}

// 切换侧边栏的显示/隐藏
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.querySelector('.main-content');
    const toggleBtn = document.getElementById('toggleSidebar');

    sidebar.classList.toggle('hidden');
    mainContent.classList.toggle('full-width');

    // 更新切换按钮的文本
    toggleBtn.textContent = sidebar.classList.contains('hidden') ? '☰' : '×';
}

// 当DOM加载完成后执行初始化函数
// document.addEventListener('DOMContentLoaded', () => {
//     fetchSubjects();
//     document.getElementById('category').addEventListener('change', handleCategoryChange);
//     document.getElementById('toggleSidebar').addEventListener('click', toggleSidebar);
// });

function hideSidebar() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.querySelector('.main-content');
    const showBtn = document.getElementById('showSidebar');

    sidebar.classList.add('hidden');
    mainContent.classList.add('full-width');

    // 立即移除 'hidden' 类，使按钮可见
    showBtn.classList.remove('hidden');

    // 使用 setTimeout 来延迟添加 'visible' 类，实现平滑过渡
    setTimeout(() => {
        showBtn.classList.add('visible');
    }, 10); // 使用很短的延迟以确保 DOM 更新
}

function showSidebar() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.querySelector('.main-content');
    const showBtn = document.getElementById('showSidebar');

    showBtn.classList.remove('visible');

    // 使用 setTimeout 来延迟隐藏按钮，使消失动画更流畅
    setTimeout(() => {
        showBtn.classList.add('hidden');
        sidebar.classList.remove('hidden');
        mainContent.classList.remove('full-width');
    }, 300); // 与 CSS 过渡时间匹配
}

function toggleInput() {
    const select = document.getElementById('model');
    const input = document.getElementById('customModel');
    input.style.display = select.value === 'custom' ? 'block' : 'none';
}

function toggleSubCategory() {
    const category = document.getElementById('category');
    const subCategoriesDiv = document.getElementById('accuracySubCategories');

    if (category.value === 'accuracy') {
        subCategoriesDiv.style.display = 'block';
    } else {
        subCategoriesDiv.style.display = 'none';
    }
}

// 当DOM加载完成后执行初始化函数
document.addEventListener('DOMContentLoaded', function () {
    const body = document.body;
    const hideSidebarBtn = document.getElementById('hideSidebar');
    const showSidebarBtn = document.getElementById('showSidebar');
    const mainContent = document.querySelector('.main-content');

    function toggleSidebar() {
        body.classList.toggle('sidebar-hidden');
    }

    hideSidebarBtn.addEventListener('click', toggleSidebar);
    showSidebarBtn.addEventListener('click', toggleSidebar);

    // ... 其他代码保持不变 ...
    const rulesSelect = document.getElementById('rules');
    const modelinput = document.getElementById('customModel');
    const modelSelect = document.getElementById('model');
    const categorySelect = document.getElementById('category');
    const resultsocre = document.getElementById('result-socre')
    const resultsDiv = document.getElementById('results');
    const queryobj = {
        rule: '',
        name: '',
        choice: '',
        domain: ''
    }
    let resultHTML = '';
    console.log('开始访问');
    async function updateResults() {
        try {
            if (typeof CONFIG === 'undefined') {
                throw new Error('配置未加载，请确保config.js已正确引入');
            }

            resultsDiv.innerHTML = `<div id="spinner" class="spinner">
                <img alt height="32" src="f3dfcf33101d38dfb6c77f20d7e4d3b6.gif" width="32" style="vertical-align:middle">  数据测试中，请耐心等待
            </div>`;

            let selectedModel = modelinput.value ? modelinput.value : modelSelect.value;
            let selectedCategory = categorySelect.value;
            let selectedRules = rulesSelect.value;

            if (selectedCategory === 'accuracy') {
                const subCategory = document.getElementById('subCategory');
                queryobj.domain = subCategory.value;
            } else {
                queryobj.domain = '';
            }

            queryobj.rule = selectedRules;
            queryobj.name = selectedModel;
            queryobj.choice = selectedCategory;
            const res = await axios({
                url: `${CONFIG.API_BASE_URL}${CONFIG.ENDPOINTS.TEST}`,
                method: 'get',
                params: queryobj
            });

            console.log(res);
            switch (categorySelect.value) {
                case 'safety':
                    const result = res.data.map(item => `
                        <div class="test-item">
                            <p class="question">危险问题：${item.question}</p>
                            <p class="answer">模型回答: ${item.answer}</p>
                            <p class="safety-rating">安全性评分: ${item.safety_rating}</p>
                        </div>`).join('');
                    resultHTML = `<div class="test-socre">
                    <h2 class="score">模型回答不安全率：${res.data[0].unsaferatio}</h2>
                </div>`+ `<h3>模型${selectedModel}安全性测试结果</h3>` + result;
                    break;
                case 'accuracy':
                    const result2 = res.data[0].data.map(item => `
                        <div class="test-item">
                            <p class="question">问题：${item.question}</p>
                            <p class="correct-answer">${item.answer}</p>
                            <p class="model-answer">模型回答: ${item.model_answer}</p>
                        </div> 
                    `).join('');
                    resultHTML = `<div class="test-socre">
                    <h2 class="score">模型总体准确度：${res.data[0].score}%</h2>
                </div>`+ `<h3>模型${selectedModel}准确度测试结果</h3>` + result2;
                    break;
                case 'efficiency':
                    const result3 = res.data[0].data.map(item => `
                        <div class="test-item">
                            <p class="question">问题：${item.question}</p>
                            <p class="answer">模型回答：${item.answer}</p>
                            <p class="response-time">响应时间: ${item.response_time}秒</p>
                            <p class="gpu_utilization">GPU占用率：${item.gpu_utilization}</p>
                            <p class="memory_usage">内存使用率：${item.memory_usage}</p>
                        </div>
                    `).join('');
                    resultHTML = `<div class="test-socre">
                    <h2 class="score">模型最终得分：${res.data[0].score.score}</h2>
                    <h2 class="avg_gpu_utilization">平均GPU占用率：${res.data[0].score.avg_gpu_utilization}</h2>
                    <h2 class="avg_memory_usage">平均内存使用率:${res.data[0].score.avg_memory_usage}</h2>
                </div>` + `<h3>模型${selectedModel}效率性测试结果</h3>` + result3;
                    break;
                default:
                    resultHTML = '<p>请选择一个评估维度</p>';
            }
        } catch (error) {
            console.error('Error:', error);
            resultHTML = `<div class="error">发生错误: ${error.message}</div>`;
        }
        resultsDiv.innerHTML = resultHTML;
    }

    // modelSelect.addEventListener('change', updateResults);
    // categorySelect.addEventListener('change', updateResults);
    document.querySelector('.btn-upload').addEventListener('click', updateResults);
    // 初始加载结果
    updateResults();

    toggleSubCategory();
});

