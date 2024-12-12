# spline-curve-implementation
根据文献中的方法，由matlab实现的各种样条曲线

Akima: 基于样条插补的高质量加工关键技术的研究 王允森 中国科学院大学

B-spline：多轴数控加工轨迹局部光顺及其轮廓控制研究 姜阳 合肥工业大学

Bezier: 微小线段高速加工的轨迹优化建模及前瞻插补技术研究 金永乔 上海交通大学

outpoint_Bspline: An analytical and optimal corner smoothing method for CNC machine tools along linear segments 李博 天津大学

PH：面向五轴加工轨迹的曲率连续光顺及其插补方法研究 石璟 上海交通大学

使用向量叉乘可以解决空间向量指向问题，右手法则

**代码实现向量e3，e4时，先使用向量叉积法判断，e3-》e4是顺时针还是逆时针。接着使用旋转矩阵，由e1旋转计算e3，e2旋转计算e4**   
                  
_![image](https://github.com/user-attachments/assets/81c09a5f-2746-4b37-9c44-f2baf96e9b3f)_
_![image](https://github.com/user-attachments/assets/031b163c-8b84-4c83-9080-9560090a0f83)_
_![image](https://github.com/user-attachments/assets/0433003f-025f-4762-bdda-b1fde81cd4c9)_
