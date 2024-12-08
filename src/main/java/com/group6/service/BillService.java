package com.group6.service;

import com.group6.mapper.BillMapper;
import com.group6.pojo.Bill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Service
public class BillService {

    @Autowired
    private BillMapper billMapper;


    public void addBill(Bill bill) {
        UUID uuid = UUID.randomUUID();
        long uniqueId = uuid.getMostSignificantBits() & Long.MAX_VALUE;
        String billId=""+uniqueId;
        billId="bill"+billId;
        bill.setId(billId);
        try {
            if(billMapper.findBillById(bill.getId()) != null) {
                throw new Exception("编号重复");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        billMapper.insertBill(bill);
    }
    public void deleteBill(Bill bill) {

        try {
            if(billMapper.findBillById(bill.getId()) == null) {
                throw new Exception("删除错误,记录不存在");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        billMapper.deleteBill(bill);
    }

    public void updateBill(Bill bill) {

        try {
            if(billMapper.findBillById(bill.getId()) == null) {
                throw new Exception("没有这条记录");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        billMapper.updateBill(bill);
    }

    public Bill getBill(Bill bill) {
        try {
            if(billMapper.findBillById(bill.getId()) == null) {
                throw new Exception("没有这条记录");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return billMapper.selectBillById(bill);
    }

    public Bill getBillByDormitory(Bill bill) {
        try {
            if(billMapper.findBillByDormitory(bill) == null) {
                throw new Exception("没有这条记录");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return billMapper.findBillByDormitory(bill);
    }
    public List<Bill> getAllBill() {
        return billMapper.selectAllBill();
    }

    public BigDecimal countByDormitory(int dormitory, int startYear, int startMonth, int endYear, int endMonth) {
        return billMapper.sumElectricityAndWaterCostByDormitory(dormitory, startYear, startMonth, endYear, endMonth);
    }

    public BigDecimal countByBuilding(int building, int startYear, int startMonth, int endYear, int endMonth) {
        return billMapper.sumElectricityAndWaterCostByBuilding(building, startYear, startMonth, endYear, endMonth);
    }

    public BigDecimal countBySchool(int startYear, int startMonth, int endYear, int endMonth) {
        return billMapper.sumElectricityAndWaterCostBySchool(startYear, startMonth, endYear, endMonth);
    }
}