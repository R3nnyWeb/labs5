using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace labs
{
	public partial class Form1 : Form
	{
		public Form1()
		{
			InitializeComponent();
		}

		private void ательеBindingNavigatorSaveItem_Click(object sender, EventArgs e)
		{
			this.Validate();
			this.ательеBindingSource.EndEdit();
			this.tableAdapterManager.UpdateAll(this.ательеDataSet);

		}

		private void ательеBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
		{
			this.Validate();
			this.ательеBindingSource.EndEdit();
			this.tableAdapterManager.UpdateAll(this.ательеDataSet);

		}

		private void Form1_Load(object sender, EventArgs e)
		{
			// TODO: данная строка кода позволяет загрузить данные в таблицу "ательеDataSet.Услуги". При необходимости она может быть перемещена или удалена.
			this.услугиTableAdapter.Fill(this.ательеDataSet.Услуги);
			// TODO: данная строка кода позволяет загрузить данные в таблицу "ательеDataSet.Стоимость". При необходимости она может быть перемещена или удалена.
			this.стоимостьTableAdapter.Fill(this.ательеDataSet.Стоимость);
			// TODO: данная строка кода позволяет загрузить данные в таблицу "ательеDataSet.Ателье". При необходимости она может быть перемещена или удалена.
			this.ательеTableAdapter.Fill(this.ательеDataSet.Ателье);

		}
	}
}
