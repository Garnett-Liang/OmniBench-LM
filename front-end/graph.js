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

  // 存储图表实例的变量
  let inverseChartInstance = null;
  let negationChartInstance = null;
  let compositeChartInstance = null;

  async function fetchDataAndRenderCharts() {
    const model = document.getElementById('model').value;
    const response = await axios.get(`${CONFIG.API_BASE_URL}${CONFIG.ENDPOINTS.GRAPH}?model=${encodeURIComponent(model)}`);

    console.log(response.data); // 调试输出，查看返回的数据格式
    console.log(response.data[0]);
    const { inverse, negation, composite } = response.data[0];

    // if (!inverse || !negation || !composite) {
    //   console.error("数据格式不正确或缺失");
    //   return;
    // }

    // 定义通用的字体样式
    const fontStyle = {
      family: 'Roboto, Arial, sans-serif',
      size: 14,
      weight: 'bold'
    };

    // 修改数据标签插件
    const dataLabelPlugin = {
      id: 'dataLabelPlugin',
      afterDatasetsDraw: function (chart) {
        const ctx = chart.ctx;
        chart.data.datasets.forEach((dataset, i) => {
          const meta = chart.getDatasetMeta(i);
          meta.data.forEach((point, index) => {
            const data = dataset.data[index];
            ctx.fillStyle = '#333';
            ctx.font = `bold 14px ${fontStyle.family}`;
            ctx.textAlign = 'center';
            ctx.fillText(data.toFixed(1) + '%', point.x, point.y - 10);
          });
        });
      }
    };

    // 销毁现有的图表实例
    if (inverseChartInstance) inverseChartInstance.destroy();
    if (negationChartInstance) negationChartInstance.destroy();
    if (compositeChartInstance) compositeChartInstance.destroy();

    // 渲染逆向推理雷达图
    const inverseCtx = document.getElementById('inverseChart').getContext('2d');
    inverseChartInstance = new Chart(inverseCtx, {
      type: 'radar',
      data: {
        labels: inverse.label || [],
        datasets: [{
          label: '逆向推理测试数据',
          data: inverse.value || [],
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 2,
          pointBackgroundColor: 'rgba(75, 192, 192, 1)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgba(75, 192, 192, 1)',
          pointRadius: 5,
          pointHoverRadius: 7
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: true,
            position: 'top',
            labels: {
              font: {
                family: fontStyle.family,
                size: 16,
                weight: 'bold'
              },
              padding: 20,
              color: '#333'
            }
          },
          title: {
            display: true,
            text: '逆向推理能力测试结果',
            font: {
              family: fontStyle.family,
              size: 20,
              weight: 'bold'
            },
            color: '#333',
            padding: 20
          },
          tooltip: {
            callbacks: {
              label: function (context) {
                return `${context.label}: ${context.raw.toFixed(1)}%`;
              }
            },
            titleFont: {
              family: fontStyle.family,
              size: 14
            },
            bodyFont: {
              family: fontStyle.family,
              size: 14
            }
          }
        },
        scales: {
          r: {
            beginAtZero: true,
            min: 0,
            max: 100,
            ticks: {
              stepSize: 20,
              font: {
                family: fontStyle.family,
                size: 12
              },
              color: '#666'
            },
            pointLabels: {
              font: {
                family: fontStyle.family,
                size: 14,
                weight: 'bold'
              },
              color: '#333'
            },
            grid: {
              color: 'rgba(200, 200, 200, 0.4)'
            },
            angleLines: {
              color: 'rgba(200, 200, 200, 0.4)'
            }
          }
        }
      },
      plugins: [dataLabelPlugin]
    });

    // 渲染否定推理雷达图
    const negationCtx = document.getElementById('negationChart').getContext('2d');
    negationChartInstance = new Chart(negationCtx, {
      type: 'radar',
      data: {
        labels: negation.label || [],
        datasets: [{
          label: '否定推理测试数据',
          data: negation.value || [],
          backgroundColor: 'rgba(54, 162, 235, 0.2)',
          borderColor: 'rgba(54, 162, 235, 1)',
          borderWidth: 2,
          pointBackgroundColor: 'rgba(54, 162, 235, 1)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgba(54, 162, 235, 1)',
          pointRadius: 5,
          pointHoverRadius: 7
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: true,
            position: 'top',
            labels: {
              font: {
                family: fontStyle.family,
                size: 16,
                weight: 'bold'
              },
              padding: 20,
              color: '#333'
            }
          },
          title: {
            display: true,
            text: '否定推理能力测试结果',
            font: {
              family: fontStyle.family,
              size: 20,
              weight: 'bold'
            },
            color: '#333',
            padding: 20
          },
          tooltip: {
            callbacks: {
              label: function (context) {
                return `${context.label}: ${context.raw.toFixed(1)}%`;
              }
            },
            titleFont: {
              family: fontStyle.family,
              size: 14
            },
            bodyFont: {
              family: fontStyle.family,
              size: 14
            }
          }
        },
        scales: {
          r: {
            beginAtZero: true,
            min: 0,
            max: 100,
            ticks: {
              stepSize: 20,
              font: {
                family: fontStyle.family,
                size: 12
              },
              color: '#666'
            },
            pointLabels: {
              font: {
                family: fontStyle.family,
                size: 14,
                weight: 'bold'
              },
              color: '#333'
            },
            grid: {
              color: 'rgba(200, 200, 200, 0.4)'
            },
            angleLines: {
              color: 'rgba(200, 200, 200, 0.4)'
            }
          }
        }
      },
      plugins: [dataLabelPlugin]
    });

    // 渲染复合推理雷达图
    const compositeCtx = document.getElementById('compositeChart').getContext('2d');
    compositeChartInstance = new Chart(compositeCtx, {
      type: 'radar',
      data: {
        labels: composite.label || [],
        datasets: [{
          label: '复合推理测试数据',
          data: composite.value || [],
          backgroundColor: 'rgba(255, 206, 86, 0.2)',
          borderColor: 'rgba(255, 206, 86, 1)',
          borderWidth: 2,
          pointBackgroundColor: 'rgba(255, 206, 86, 1)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgba(255, 206, 86, 1)',
          pointRadius: 5,
          pointHoverRadius: 7
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            display: true,
            position: 'top',
            labels: {
              font: {
                family: fontStyle.family,
                size: 16,
                weight: 'bold'
              },
              padding: 20,
              color: '#333'
            }
          },
          title: {
            display: true,
            text: '复合推理能力测试结果',
            font: {
              family: fontStyle.family,
              size: 20,
              weight: 'bold'
            },
            color: '#333',
            padding: 20
          },
          tooltip: {
            callbacks: {
              label: function (context) {
                return `${context.label}: ${context.raw.toFixed(1)}%`;
              }
            },
            titleFont: {
              family: fontStyle.family,
              size: 14
            },
            bodyFont: {
              family: fontStyle.family,
              size: 14
            }
          }
        },
        scales: {
          r: {
            beginAtZero: true,
            min: 0,
            max: 100,
            ticks: {
              stepSize: 20,
              font: {
                family: fontStyle.family,
                size: 12
              },
              color: '#666'
            },
            pointLabels: {
              font: {
                family: fontStyle.family,
                size: 14,
                weight: 'bold'
              },
              color: '#333'
            },
            grid: {
              color: 'rgba(200, 200, 200, 0.4)'
            },
            angleLines: {
              color: 'rgba(200, 200, 200, 0.4)'
            }
          }
        }
      },
      plugins: [dataLabelPlugin]
    });
  }

  // 在模型选择变化时调用该函数
  document.getElementById('model').addEventListener('change', fetchDataAndRenderCharts);
  // 初始加载结果
  fetchDataAndRenderCharts();
});





