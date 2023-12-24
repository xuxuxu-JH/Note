using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataStructure;
class Array1
{
    #region 基本属性
    private int[] data;
    //数组中实际元素的个数
    private int N;
    //返回数组容量,容量 = Length
    public int Capacity
    {
        get { return data.Length; }
    }

    //有参构造,自定义数组初始容量
    public Array1(int capacity)
    {
        data = new int[capacity];
        N = 0;
    }
    //默认无参构造,数组初始容量为10
    public Array1() : this(10) { }

    //返回数组中元素的个数
    public int Count
    {
        get { return N; }
    }
    //返回数组是否为空
    public bool IsEmpty
    {
        get { return N == 0; }
    }
    #endregion

    #region 基本函数
    /// <summary>
    ///> 为数组的指定位置添加元素
    /// </summary>
    /// <param name="index">位置索引</param>
    /// <param name="e">元素值</param>
    public void Add(int index, int e)
    {
        if (index < 0 || index > N)
            throw new ArgumentException("index_数组索引越界");
        if (N == data.Length)
            throw new ArgumentException("数组容量已满");

        for (int i = N - 1; i >= index; i++)
        {
            //往数组中添加任意元素之前先进行元素迁移,再进行添加 
            data[i + 1] = data[i];
        }

        data[index] = e;
        N++;
    }
    /// <summary>
    /// 为数组末尾添加元素
    /// </summary>
    /// <param name="e"></param>
    public void AddLast(int e)
    {
        //直接调用Add函数即可,只会执行 data[index] = e; N++ 这两句
        Add(N, e);
    }
    public void AddFirst(int e)
    {
        Add(0, e);
    }

    //重写Object中的ToString函数,使用Console直接访问Array1类对象的时候能够直接得到数组信息
    public override string ToString()
    {
        StringBuilder res = new StringBuilder();
        //输出数组中的元素个数和数组容量
        //Append在字符串末尾添加内容
        //Format使用占位符格式化输出
        res.Append(string.Format("Attay1: Count={0} , Capacity={1}\n", N, data.Length));
        res.Append("[");
        //遍历内部数组,将数组内所有的元素添加进字符串中
        for (int i = 0; i < N; i++)
        {
            res.Append(data[i]);
            if (i != N - 1)//到底了
                res.Append(", ");
        }
        res.Append("]");
        return res.ToString();
    }
    #endregion
}

