import 'package:ab_assignment/models/bank_account.dart';
import 'package:ab_assignment/utils/dimen.dart';
import 'package:flutter/material.dart';

class BankAccountListItem extends StatelessWidget {
  final BankAccount bankAccount;
  final Function()? onTap;

  const BankAccountListItem({Key? key, required this.bankAccount, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(paddingSizeSmall),
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(cornerRadius))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${bankAccount.number} - ${bankAccount.type}",style: TextStyle(fontWeight: FontWeight.bold),),
            Text(bankAccount.branch,style: Theme.of(context).textTheme.caption,),
            SizedBox(height: paddingSize,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Kullanılabilir Bakiye",style: Theme.of(context).textTheme.caption,),
                Text(bankAccount.availableBalance.toString()+ " TL",style:  Theme.of(context).textTheme.caption,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Bakiye",style: Theme.of(context).textTheme.caption,), Text(bankAccount.balance.toString()+" TL",style: Theme.of(context).textTheme.caption,)],
            )
          ],
        ),
      ),
    );
  }
}