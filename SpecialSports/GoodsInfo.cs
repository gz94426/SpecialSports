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
    
    public partial class GoodsInfo
    {
        public int Id { get; set; }
        public string GoodsName { get; set; }
        public string Goods_number { get; set; }
        public string GoodsURL { get; set; }
        public string Goods_remark { get; set; }
        public Nullable<decimal> Goods_price { get; set; }
        public Nullable<System.DateTime> Goods_addtime { get; set; }
        public Nullable<int> Goods_recommend { get; set; }
        public Nullable<int> Goods_grounding { get; set; }
        public string Goods_filed { get; set; }
        public Nullable<int> Goods_season { get; set; }
        public Nullable<int> Goods_isDel { get; set; }
        public Nullable<int> StoreInfo_ID { get; set; }
        public Nullable<int> GoodsType_ID { get; set; }
    }
}
