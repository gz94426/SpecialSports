﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SportsDBEntities : DbContext
    {
        public SportsDBEntities()
            : base("name=SportsDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Collect> Collect { get; set; }
        public DbSet<Evaluate> Evaluate { get; set; }
        public DbSet<GoodsE> GoodsE { get; set; }
        public DbSet<GoodsImg> GoodsImg { get; set; }
        public DbSet<GoodsInfo> GoodsInfo { get; set; }
        public DbSet<GoodsType> GoodsType { get; set; }
        public DbSet<Logistics> Logistics { get; set; }
        public DbSet<NoticeInfo> NoticeInfo { get; set; }
        public DbSet<ShopManagement> ShopManagement { get; set; }
        public DbSet<StoreInfo> StoreInfo { get; set; }
        public DbSet<StoreInfo_X_GoodsType> StoreInfo_X_GoodsType { get; set; }
        public DbSet<tbl_AddressInfo> tbl_AddressInfo { get; set; }
        public DbSet<tbl_manager> tbl_manager { get; set; }
        public DbSet<TurnsImg> TurnsImg { get; set; }
        public DbSet<UserInfo> UserInfo { get; set; }
        public DbSet<GoodsTypeInfo> GoodsTypeInfo { get; set; }
        public DbSet<OrderBySeller> OrderBySeller { get; set; }
        public DbSet<tbl_orderdetailsInfo> tbl_orderdetailsInfo { get; set; }
        public DbSet<History> History { get; set; }
        public DbSet<UserInfo_detail> UserInfo_detail { get; set; }
        public DbSet<tbl_county> tbl_county { get; set; }
        public DbSet<tbl_province> tbl_province { get; set; }
        public DbSet<tbl_city> tbl_city { get; set; }
    }
}
