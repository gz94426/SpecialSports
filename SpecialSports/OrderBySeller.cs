//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace SpecialSports
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderBySeller
    {
        public int order_id { get; set; }
        public Nullable<System.DateTime> order_createTime { get; set; }
        public Nullable<int> order_status { get; set; }
        public Nullable<int> orderdetails_status { get; set; }
        public Nullable<decimal> order_cost { get; set; }
        public Nullable<int> userid { get; set; }
        public Nullable<int> GoodsInfo_ID { get; set; }
        public string order_no { get; set; }
        public Nullable<System.DateTime> order_paytime { get; set; }
        public Nullable<System.DateTime> order_shiptime { get; set; }
        public Nullable<System.DateTime> order_makedtime { get; set; }
    }
}