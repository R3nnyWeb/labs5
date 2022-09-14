namespace labs
{
	partial class Form1
	{
		/// <summary>
		/// Обязательная переменная конструктора.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Освободить все используемые ресурсы.
		/// </summary>
		/// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Код, автоматически созданный конструктором форм Windows

		/// <summary>
		/// Требуемый метод для поддержки конструктора — не изменяйте 
		/// содержимое этого метода с помощью редактора кода.
		/// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
			System.Windows.Forms.Label номерLabel;
			System.Windows.Forms.Label названиеLabel;
			System.Windows.Forms.Label адресLabel;
			System.Windows.Forms.Label телефонLabel;
			this.TabControl = new System.Windows.Forms.TabControl();
			this.tabPage1 = new System.Windows.Forms.TabPage();
			this.tabPage2 = new System.Windows.Forms.TabPage();
			this.ательеDataSet = new labs.АтельеDataSet();
			this.ательеBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.ательеTableAdapter = new labs.АтельеDataSetTableAdapters.АтельеTableAdapter();
			this.tableAdapterManager = new labs.АтельеDataSetTableAdapters.TableAdapterManager();
			this.ательеBindingNavigator = new System.Windows.Forms.BindingNavigator(this.components);
			this.bindingNavigatorAddNewItem = new System.Windows.Forms.ToolStripButton();
			this.bindingNavigatorCountItem = new System.Windows.Forms.ToolStripLabel();
			this.bindingNavigatorDeleteItem = new System.Windows.Forms.ToolStripButton();
			this.bindingNavigatorMoveFirstItem = new System.Windows.Forms.ToolStripButton();
			this.bindingNavigatorMovePreviousItem = new System.Windows.Forms.ToolStripButton();
			this.bindingNavigatorSeparator = new System.Windows.Forms.ToolStripSeparator();
			this.bindingNavigatorPositionItem = new System.Windows.Forms.ToolStripTextBox();
			this.bindingNavigatorSeparator1 = new System.Windows.Forms.ToolStripSeparator();
			this.bindingNavigatorMoveNextItem = new System.Windows.Forms.ToolStripButton();
			this.bindingNavigatorMoveLastItem = new System.Windows.Forms.ToolStripButton();
			this.bindingNavigatorSeparator2 = new System.Windows.Forms.ToolStripSeparator();
			this.ательеBindingNavigatorSaveItem = new System.Windows.Forms.ToolStripButton();
			this.номерTextBox = new System.Windows.Forms.TextBox();
			this.названиеTextBox = new System.Windows.Forms.TextBox();
			this.адресTextBox = new System.Windows.Forms.TextBox();
			this.телефонTextBox = new System.Windows.Forms.TextBox();
			this.стоимостьBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.стоимостьTableAdapter = new labs.АтельеDataSetTableAdapters.СтоимостьTableAdapter();
			this.стоимостьDataGridView = new System.Windows.Forms.DataGridView();
			this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.услугиBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.услугиTableAdapter = new labs.АтельеDataSetTableAdapters.УслугиTableAdapter();
			this.услугиDataGridView = new System.Windows.Forms.DataGridView();
			this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.dataGridViewTextBoxColumn6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.стоимостьBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
			this.стоимостьDataGridView1 = new System.Windows.Forms.DataGridView();
			this.dataGridViewTextBoxColumn7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.dataGridViewTextBoxColumn8 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.dataGridViewTextBoxColumn9 = new System.Windows.Forms.DataGridViewTextBoxColumn();
			номерLabel = new System.Windows.Forms.Label();
			названиеLabel = new System.Windows.Forms.Label();
			адресLabel = new System.Windows.Forms.Label();
			телефонLabel = new System.Windows.Forms.Label();
			this.TabControl.SuspendLayout();
			this.tabPage1.SuspendLayout();
			this.tabPage2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.ательеDataSet)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.ательеBindingSource)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.ательеBindingNavigator)).BeginInit();
			this.ательеBindingNavigator.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьBindingSource)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьDataGridView)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.услугиBindingSource)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.услугиDataGridView)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьBindingSource1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьDataGridView1)).BeginInit();
			this.SuspendLayout();
			// 
			// TabControl
			// 
			this.TabControl.Controls.Add(this.tabPage1);
			this.TabControl.Controls.Add(this.tabPage2);
			this.TabControl.Location = new System.Drawing.Point(0, 30);
			this.TabControl.Name = "TabControl";
			this.TabControl.SelectedIndex = 0;
			this.TabControl.Size = new System.Drawing.Size(800, 446);
			this.TabControl.TabIndex = 0;
			// 
			// tabPage1
			// 
			this.tabPage1.AutoScroll = true;
			this.tabPage1.Controls.Add(this.стоимостьDataGridView);
			this.tabPage1.Controls.Add(телефонLabel);
			this.tabPage1.Controls.Add(this.телефонTextBox);
			this.tabPage1.Controls.Add(адресLabel);
			this.tabPage1.Controls.Add(this.адресTextBox);
			this.tabPage1.Controls.Add(названиеLabel);
			this.tabPage1.Controls.Add(this.названиеTextBox);
			this.tabPage1.Controls.Add(номерLabel);
			this.tabPage1.Controls.Add(this.номерTextBox);
			this.tabPage1.Location = new System.Drawing.Point(4, 25);
			this.tabPage1.Name = "tabPage1";
			this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
			this.tabPage1.Size = new System.Drawing.Size(792, 417);
			this.tabPage1.TabIndex = 0;
			this.tabPage1.Text = "Ателье";
			this.tabPage1.UseVisualStyleBackColor = true;
			// 
			// tabPage2
			// 
			this.tabPage2.AutoScroll = true;
			this.tabPage2.Controls.Add(this.стоимостьDataGridView1);
			this.tabPage2.Controls.Add(this.услугиDataGridView);
			this.tabPage2.Location = new System.Drawing.Point(4, 25);
			this.tabPage2.Name = "tabPage2";
			this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
			this.tabPage2.Size = new System.Drawing.Size(792, 417);
			this.tabPage2.TabIndex = 1;
			this.tabPage2.Text = "Услуги";
			this.tabPage2.UseVisualStyleBackColor = true;
			// 
			// ательеDataSet
			// 
			this.ательеDataSet.DataSetName = "АтельеDataSet";
			this.ательеDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
			// 
			// ательеBindingSource
			// 
			this.ательеBindingSource.DataMember = "Ателье";
			this.ательеBindingSource.DataSource = this.ательеDataSet;
			// 
			// ательеTableAdapter
			// 
			this.ательеTableAdapter.ClearBeforeFill = true;
			// 
			// tableAdapterManager
			// 
			this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
			this.tableAdapterManager.UpdateOrder = labs.АтельеDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
			this.tableAdapterManager.АтельеTableAdapter = this.ательеTableAdapter;
			this.tableAdapterManager.СтоимостьTableAdapter = null;
			this.tableAdapterManager.УслугиTableAdapter = null;
			// 
			// ательеBindingNavigator
			// 
			this.ательеBindingNavigator.AddNewItem = this.bindingNavigatorAddNewItem;
			this.ательеBindingNavigator.BindingSource = this.ательеBindingSource;
			this.ательеBindingNavigator.CountItem = this.bindingNavigatorCountItem;
			this.ательеBindingNavigator.DeleteItem = this.bindingNavigatorDeleteItem;
			this.ательеBindingNavigator.ImageScalingSize = new System.Drawing.Size(20, 20);
			this.ательеBindingNavigator.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.bindingNavigatorMoveFirstItem,
            this.bindingNavigatorMovePreviousItem,
            this.bindingNavigatorSeparator,
            this.bindingNavigatorPositionItem,
            this.bindingNavigatorCountItem,
            this.bindingNavigatorSeparator1,
            this.bindingNavigatorMoveNextItem,
            this.bindingNavigatorMoveLastItem,
            this.bindingNavigatorSeparator2,
            this.bindingNavigatorAddNewItem,
            this.bindingNavigatorDeleteItem,
            this.ательеBindingNavigatorSaveItem});
			this.ательеBindingNavigator.Location = new System.Drawing.Point(0, 0);
			this.ательеBindingNavigator.MoveFirstItem = this.bindingNavigatorMoveFirstItem;
			this.ательеBindingNavigator.MoveLastItem = this.bindingNavigatorMoveLastItem;
			this.ательеBindingNavigator.MoveNextItem = this.bindingNavigatorMoveNextItem;
			this.ательеBindingNavigator.MovePreviousItem = this.bindingNavigatorMovePreviousItem;
			this.ательеBindingNavigator.Name = "ательеBindingNavigator";
			this.ательеBindingNavigator.PositionItem = this.bindingNavigatorPositionItem;
			this.ательеBindingNavigator.Size = new System.Drawing.Size(800, 31);
			this.ательеBindingNavigator.TabIndex = 1;
			this.ательеBindingNavigator.Text = "bindingNavigator1";
			// 
			// bindingNavigatorAddNewItem
			// 
			this.bindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.bindingNavigatorAddNewItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorAddNewItem.Image")));
			this.bindingNavigatorAddNewItem.Name = "bindingNavigatorAddNewItem";
			this.bindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = true;
			this.bindingNavigatorAddNewItem.Size = new System.Drawing.Size(29, 28);
			this.bindingNavigatorAddNewItem.Text = "Добавить";
			// 
			// bindingNavigatorCountItem
			// 
			this.bindingNavigatorCountItem.Name = "bindingNavigatorCountItem";
			this.bindingNavigatorCountItem.Size = new System.Drawing.Size(55, 28);
			this.bindingNavigatorCountItem.Text = "для {0}";
			this.bindingNavigatorCountItem.ToolTipText = "Общее число элементов";
			// 
			// bindingNavigatorDeleteItem
			// 
			this.bindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.bindingNavigatorDeleteItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorDeleteItem.Image")));
			this.bindingNavigatorDeleteItem.Name = "bindingNavigatorDeleteItem";
			this.bindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = true;
			this.bindingNavigatorDeleteItem.Size = new System.Drawing.Size(29, 28);
			this.bindingNavigatorDeleteItem.Text = "Удалить";
			// 
			// bindingNavigatorMoveFirstItem
			// 
			this.bindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.bindingNavigatorMoveFirstItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveFirstItem.Image")));
			this.bindingNavigatorMoveFirstItem.Name = "bindingNavigatorMoveFirstItem";
			this.bindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = true;
			this.bindingNavigatorMoveFirstItem.Size = new System.Drawing.Size(29, 28);
			this.bindingNavigatorMoveFirstItem.Text = "Переместить в начало";
			// 
			// bindingNavigatorMovePreviousItem
			// 
			this.bindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.bindingNavigatorMovePreviousItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMovePreviousItem.Image")));
			this.bindingNavigatorMovePreviousItem.Name = "bindingNavigatorMovePreviousItem";
			this.bindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = true;
			this.bindingNavigatorMovePreviousItem.Size = new System.Drawing.Size(29, 28);
			this.bindingNavigatorMovePreviousItem.Text = "Переместить назад";
			// 
			// bindingNavigatorSeparator
			// 
			this.bindingNavigatorSeparator.Name = "bindingNavigatorSeparator";
			this.bindingNavigatorSeparator.Size = new System.Drawing.Size(6, 31);
			// 
			// bindingNavigatorPositionItem
			// 
			this.bindingNavigatorPositionItem.AccessibleName = "Положение";
			this.bindingNavigatorPositionItem.AutoSize = false;
			this.bindingNavigatorPositionItem.Name = "bindingNavigatorPositionItem";
			this.bindingNavigatorPositionItem.Size = new System.Drawing.Size(50, 27);
			this.bindingNavigatorPositionItem.Text = "0";
			this.bindingNavigatorPositionItem.ToolTipText = "Текущее положение";
			// 
			// bindingNavigatorSeparator1
			// 
			this.bindingNavigatorSeparator1.Name = "bindingNavigatorSeparator1";
			this.bindingNavigatorSeparator1.Size = new System.Drawing.Size(6, 31);
			// 
			// bindingNavigatorMoveNextItem
			// 
			this.bindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.bindingNavigatorMoveNextItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveNextItem.Image")));
			this.bindingNavigatorMoveNextItem.Name = "bindingNavigatorMoveNextItem";
			this.bindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = true;
			this.bindingNavigatorMoveNextItem.Size = new System.Drawing.Size(29, 28);
			this.bindingNavigatorMoveNextItem.Text = "Переместить вперед";
			// 
			// bindingNavigatorMoveLastItem
			// 
			this.bindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.bindingNavigatorMoveLastItem.Image = ((System.Drawing.Image)(resources.GetObject("bindingNavigatorMoveLastItem.Image")));
			this.bindingNavigatorMoveLastItem.Name = "bindingNavigatorMoveLastItem";
			this.bindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = true;
			this.bindingNavigatorMoveLastItem.Size = new System.Drawing.Size(29, 28);
			this.bindingNavigatorMoveLastItem.Text = "Переместить в конец";
			// 
			// bindingNavigatorSeparator2
			// 
			this.bindingNavigatorSeparator2.Name = "bindingNavigatorSeparator2";
			this.bindingNavigatorSeparator2.Size = new System.Drawing.Size(6, 31);
			// 
			// ательеBindingNavigatorSaveItem
			// 
			this.ательеBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			this.ательеBindingNavigatorSaveItem.Image = ((System.Drawing.Image)(resources.GetObject("ательеBindingNavigatorSaveItem.Image")));
			this.ательеBindingNavigatorSaveItem.Name = "ательеBindingNavigatorSaveItem";
			this.ательеBindingNavigatorSaveItem.Size = new System.Drawing.Size(29, 28);
			this.ательеBindingNavigatorSaveItem.Text = "Сохранить данные";
			this.ательеBindingNavigatorSaveItem.Click += new System.EventHandler(this.ательеBindingNavigatorSaveItem_Click_1);
			// 
			// номерLabel
			// 
			номерLabel.AutoSize = true;
			номерLabel.Location = new System.Drawing.Point(36, 37);
			номерLabel.Name = "номерLabel";
			номерLabel.Size = new System.Drawing.Size(53, 16);
			номерLabel.TabIndex = 0;
			номерLabel.Text = "Номер:";
			// 
			// номерTextBox
			// 
			this.номерTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.ательеBindingSource, "Номер", true));
			this.номерTextBox.Location = new System.Drawing.Point(95, 34);
			this.номерTextBox.Name = "номерTextBox";
			this.номерTextBox.Size = new System.Drawing.Size(100, 22);
			this.номерTextBox.TabIndex = 1;
			// 
			// названиеLabel
			// 
			названиеLabel.AutoSize = true;
			названиеLabel.Location = new System.Drawing.Point(37, 84);
			названиеLabel.Name = "названиеLabel";
			названиеLabel.Size = new System.Drawing.Size(76, 16);
			названиеLabel.TabIndex = 2;
			названиеLabel.Text = "Название:";
			// 
			// названиеTextBox
			// 
			this.названиеTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.ательеBindingSource, "Название", true));
			this.названиеTextBox.Location = new System.Drawing.Point(119, 81);
			this.названиеTextBox.Name = "названиеTextBox";
			this.названиеTextBox.Size = new System.Drawing.Size(100, 22);
			this.названиеTextBox.TabIndex = 3;
			// 
			// адресLabel
			// 
			адресLabel.AutoSize = true;
			адресLabel.Location = new System.Drawing.Point(39, 134);
			адресLabel.Name = "адресLabel";
			адресLabel.Size = new System.Drawing.Size(50, 16);
			адресLabel.TabIndex = 4;
			адресLabel.Text = "Адрес:";
			// 
			// адресTextBox
			// 
			this.адресTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.ательеBindingSource, "Адрес", true));
			this.адресTextBox.Location = new System.Drawing.Point(95, 131);
			this.адресTextBox.Name = "адресTextBox";
			this.адресTextBox.Size = new System.Drawing.Size(100, 22);
			this.адресTextBox.TabIndex = 5;
			// 
			// телефонLabel
			// 
			телефонLabel.AutoSize = true;
			телефонLabel.Location = new System.Drawing.Point(41, 193);
			телефонLabel.Name = "телефонLabel";
			телефонLabel.Size = new System.Drawing.Size(70, 16);
			телефонLabel.TabIndex = 6;
			телефонLabel.Text = "Телефон:";
			// 
			// телефонTextBox
			// 
			this.телефонTextBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.ательеBindingSource, "Телефон", true));
			this.телефонTextBox.Location = new System.Drawing.Point(117, 190);
			this.телефонTextBox.Name = "телефонTextBox";
			this.телефонTextBox.Size = new System.Drawing.Size(100, 22);
			this.телефонTextBox.TabIndex = 7;
			// 
			// стоимостьBindingSource
			// 
			this.стоимостьBindingSource.DataMember = "FK_Стоимость_Ателье";
			this.стоимостьBindingSource.DataSource = this.ательеBindingSource;
			// 
			// стоимостьTableAdapter
			// 
			this.стоимостьTableAdapter.ClearBeforeFill = true;
			// 
			// стоимостьDataGridView
			// 
			this.стоимостьDataGridView.AutoGenerateColumns = false;
			this.стоимостьDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			this.стоимостьDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn2,
            this.dataGridViewTextBoxColumn3});
			this.стоимостьDataGridView.DataSource = this.стоимостьBindingSource;
			this.стоимостьDataGridView.Location = new System.Drawing.Point(19, 241);
			this.стоимостьDataGridView.Name = "стоимостьDataGridView";
			this.стоимостьDataGridView.RowHeadersWidth = 51;
			this.стоимостьDataGridView.RowTemplate.Height = 24;
			this.стоимостьDataGridView.Size = new System.Drawing.Size(625, 156);
			this.стоимостьDataGridView.TabIndex = 8;
			// 
			// dataGridViewTextBoxColumn1
			// 
			this.dataGridViewTextBoxColumn1.DataPropertyName = "Ателье";
			this.dataGridViewTextBoxColumn1.HeaderText = "Ателье";
			this.dataGridViewTextBoxColumn1.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
			this.dataGridViewTextBoxColumn1.Width = 125;
			// 
			// dataGridViewTextBoxColumn2
			// 
			this.dataGridViewTextBoxColumn2.DataPropertyName = "Услуга";
			this.dataGridViewTextBoxColumn2.HeaderText = "Услуга";
			this.dataGridViewTextBoxColumn2.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
			this.dataGridViewTextBoxColumn2.Width = 125;
			// 
			// dataGridViewTextBoxColumn3
			// 
			this.dataGridViewTextBoxColumn3.DataPropertyName = "Стоимость";
			this.dataGridViewTextBoxColumn3.HeaderText = "Стоимость";
			this.dataGridViewTextBoxColumn3.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
			this.dataGridViewTextBoxColumn3.Width = 125;
			// 
			// услугиBindingSource
			// 
			this.услугиBindingSource.DataMember = "Услуги";
			this.услугиBindingSource.DataSource = this.ательеDataSet;
			// 
			// услугиTableAdapter
			// 
			this.услугиTableAdapter.ClearBeforeFill = true;
			// 
			// услугиDataGridView
			// 
			this.услугиDataGridView.AutoGenerateColumns = false;
			this.услугиDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			this.услугиDataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn4,
            this.dataGridViewTextBoxColumn5,
            this.dataGridViewTextBoxColumn6});
			this.услугиDataGridView.DataSource = this.услугиBindingSource;
			this.услугиDataGridView.Location = new System.Drawing.Point(8, 16);
			this.услугиDataGridView.Name = "услугиDataGridView";
			this.услугиDataGridView.RowHeadersWidth = 51;
			this.услугиDataGridView.RowTemplate.Height = 24;
			this.услугиDataGridView.Size = new System.Drawing.Size(714, 231);
			this.услугиDataGridView.TabIndex = 0;
			// 
			// dataGridViewTextBoxColumn4
			// 
			this.dataGridViewTextBoxColumn4.DataPropertyName = "Код";
			this.dataGridViewTextBoxColumn4.HeaderText = "Код";
			this.dataGridViewTextBoxColumn4.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
			this.dataGridViewTextBoxColumn4.ReadOnly = true;
			this.dataGridViewTextBoxColumn4.Width = 125;
			// 
			// dataGridViewTextBoxColumn5
			// 
			this.dataGridViewTextBoxColumn5.DataPropertyName = "Название";
			this.dataGridViewTextBoxColumn5.HeaderText = "Название";
			this.dataGridViewTextBoxColumn5.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
			this.dataGridViewTextBoxColumn5.Width = 125;
			// 
			// dataGridViewTextBoxColumn6
			// 
			this.dataGridViewTextBoxColumn6.DataPropertyName = "Длительность выполнения";
			this.dataGridViewTextBoxColumn6.HeaderText = "Длительность выполнения";
			this.dataGridViewTextBoxColumn6.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn6.Name = "dataGridViewTextBoxColumn6";
			this.dataGridViewTextBoxColumn6.Width = 125;
			// 
			// стоимостьBindingSource1
			// 
			this.стоимостьBindingSource1.DataMember = "FK_Стоимость_Услуги";
			this.стоимостьBindingSource1.DataSource = this.услугиBindingSource;
			// 
			// стоимостьDataGridView1
			// 
			this.стоимостьDataGridView1.AutoGenerateColumns = false;
			this.стоимостьDataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			this.стоимостьDataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn7,
            this.dataGridViewTextBoxColumn8,
            this.dataGridViewTextBoxColumn9});
			this.стоимостьDataGridView1.DataSource = this.стоимостьBindingSource1;
			this.стоимостьDataGridView1.Location = new System.Drawing.Point(8, 258);
			this.стоимостьDataGridView1.Name = "стоимостьDataGridView1";
			this.стоимостьDataGridView1.RowHeadersWidth = 51;
			this.стоимостьDataGridView1.RowTemplate.Height = 24;
			this.стоимостьDataGridView1.Size = new System.Drawing.Size(556, 138);
			this.стоимостьDataGridView1.TabIndex = 1;
			// 
			// dataGridViewTextBoxColumn7
			// 
			this.dataGridViewTextBoxColumn7.DataPropertyName = "Ателье";
			this.dataGridViewTextBoxColumn7.HeaderText = "Ателье";
			this.dataGridViewTextBoxColumn7.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn7.Name = "dataGridViewTextBoxColumn7";
			this.dataGridViewTextBoxColumn7.Width = 125;
			// 
			// dataGridViewTextBoxColumn8
			// 
			this.dataGridViewTextBoxColumn8.DataPropertyName = "Услуга";
			this.dataGridViewTextBoxColumn8.HeaderText = "Услуга";
			this.dataGridViewTextBoxColumn8.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn8.Name = "dataGridViewTextBoxColumn8";
			this.dataGridViewTextBoxColumn8.Width = 125;
			// 
			// dataGridViewTextBoxColumn9
			// 
			this.dataGridViewTextBoxColumn9.DataPropertyName = "Стоимость";
			this.dataGridViewTextBoxColumn9.HeaderText = "Стоимость";
			this.dataGridViewTextBoxColumn9.MinimumWidth = 6;
			this.dataGridViewTextBoxColumn9.Name = "dataGridViewTextBoxColumn9";
			this.dataGridViewTextBoxColumn9.Width = 125;
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(800, 896);
			this.Controls.Add(this.ательеBindingNavigator);
			this.Controls.Add(this.TabControl);
			this.Name = "Form1";
			this.Text = "Form1";
			this.Load += new System.EventHandler(this.Form1_Load);
			this.TabControl.ResumeLayout(false);
			this.tabPage1.ResumeLayout(false);
			this.tabPage1.PerformLayout();
			this.tabPage2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.ательеDataSet)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.ательеBindingSource)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.ательеBindingNavigator)).EndInit();
			this.ательеBindingNavigator.ResumeLayout(false);
			this.ательеBindingNavigator.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьBindingSource)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьDataGridView)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.услугиBindingSource)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.услугиDataGridView)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьBindingSource1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.стоимостьDataGridView1)).EndInit();
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.Windows.Forms.TabControl TabControl;
		private System.Windows.Forms.TabPage tabPage1;
		private System.Windows.Forms.TabPage tabPage2;
		private АтельеDataSet ательеDataSet;
		private System.Windows.Forms.BindingSource ательеBindingSource;
		private АтельеDataSetTableAdapters.АтельеTableAdapter ательеTableAdapter;
		private АтельеDataSetTableAdapters.TableAdapterManager tableAdapterManager;
		private System.Windows.Forms.BindingNavigator ательеBindingNavigator;
		private System.Windows.Forms.ToolStripButton bindingNavigatorAddNewItem;
		private System.Windows.Forms.ToolStripLabel bindingNavigatorCountItem;
		private System.Windows.Forms.ToolStripButton bindingNavigatorDeleteItem;
		private System.Windows.Forms.ToolStripButton bindingNavigatorMoveFirstItem;
		private System.Windows.Forms.ToolStripButton bindingNavigatorMovePreviousItem;
		private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator;
		private System.Windows.Forms.ToolStripTextBox bindingNavigatorPositionItem;
		private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator1;
		private System.Windows.Forms.ToolStripButton bindingNavigatorMoveNextItem;
		private System.Windows.Forms.ToolStripButton bindingNavigatorMoveLastItem;
		private System.Windows.Forms.ToolStripSeparator bindingNavigatorSeparator2;
		private System.Windows.Forms.ToolStripButton ательеBindingNavigatorSaveItem;
		private System.Windows.Forms.TextBox телефонTextBox;
		private System.Windows.Forms.TextBox адресTextBox;
		private System.Windows.Forms.TextBox названиеTextBox;
		private System.Windows.Forms.TextBox номерTextBox;
		private System.Windows.Forms.BindingSource стоимостьBindingSource;
		private АтельеDataSetTableAdapters.СтоимостьTableAdapter стоимостьTableAdapter;
		private System.Windows.Forms.DataGridView стоимостьDataGridView;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
		private System.Windows.Forms.BindingSource услугиBindingSource;
		private АтельеDataSetTableAdapters.УслугиTableAdapter услугиTableAdapter;
		private System.Windows.Forms.DataGridView стоимостьDataGridView1;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn7;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn8;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn9;
		private System.Windows.Forms.BindingSource стоимостьBindingSource1;
		private System.Windows.Forms.DataGridView услугиDataGridView;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
		private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn6;
	}
}

