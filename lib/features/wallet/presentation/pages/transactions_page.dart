import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../../shared/widgets/app_bottom_sheet.dart';
import '../../../../shared/widgets/custom_button.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String filter = 'All';
  DateTimeRange? dateRange;

  final List<_Txn> transactions = _sampleTransactions;

  List<_Txn> get filtered {
    var list = transactions;

    if (filter != 'All') {
      list = list.where((t) => t.type == filter).toList();
    }

    if (dateRange != null) {
      list = list.where((t) {
        final d = _parseDate(t.date);
        return !d.isBefore(dateRange!.start) && !d.isAfter(dateRange!.end);
      }).toList();
    }

    return list;
  }

  DateTime _parseDate(String v) {
    final p = v.split('.');
    return DateTime(
      int.parse(p[2]),
      int.parse(p[1]),
      int.parse(p[0]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(
              title: 'Manage Your Funds',
              subtitle: 'Transactions',
              showBackButton: true,
              onLeadingTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
            _FilterChips(
              selected: filter,
              onChanged: (v) => setState(() => filter = v),
            ),
            const SizedBox(height: 8),
            _DateRangeFilter(
              dateRange: dateRange,
              onDateRangeChanged: (r) => setState(() => dateRange = r),
              onClearDateRange: () => setState(() => dateRange = null),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: filtered.length,
                itemBuilder: (_, i) =>
                    TransactionItem(transaction: filtered[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _FilterChips({
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = ['All', 'Withdrawal', 'Earning', 'Purchase'];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final v = items[i];
          final active = selected == v;

          return ChoiceChip(
            label: Text(v),
            selected: active,
            onSelected: (_) => onChanged(v),
            backgroundColor: AppTheme.surfaceDark,
            selectedColor: AppTheme.primaryGreen,
            showCheckmark: false,
            avatar: active
                ? Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
            labelStyle: TextStyle(
              color: active ? Colors.white : AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          );
        },
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final _Txn transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final positive = transaction.amount > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Row(
        children: [
          _Icon(type: transaction.type),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${positive ? '+' : '-'} ₦${transaction.amount.abs().toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color:
                      positive ? AppTheme.primaryGreen : AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                transaction.date,
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final String type;

  const _Icon({required this.type});

  @override
  Widget build(BuildContext context) {
    late IconData icon;
    late Color bg;
    late Color fg;

    switch (type) {
      case 'Withdrawal':
        icon = Icons.arrow_upward;
        bg = AppTheme.surfaceDark;
        fg = Colors.white;
        break;
      case 'Purchase':
        icon = FontAwesomeIcons.xmark;
        bg = AppTheme.danger.withOpacity(0.15);
        fg = AppTheme.danger;
        break;
      default:
        icon = Icons.arrow_downward;
        bg = AppTheme.primaryGreen.withOpacity(0.15);
        fg = AppTheme.primaryGreen;
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: fg, size: 18),
    );
  }
}

class _Txn {
  final String title;
  final String subtitle;
  final double amount;
  final String date;
  final String type;

  _Txn({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.type,
  });
}

final List<_Txn> _sampleTransactions = [
  _Txn(
      title: 'PET Sale',
      subtitle: 'Plastic recycling',
      amount: 182.99,
      date: '12.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Withdrawal',
      subtitle: 'Bank transfer',
      amount: -132.05,
      date: '12.01.2024',
      type: 'Withdrawal'),
  _Txn(
      title: 'Airtime',
      subtitle: 'MTN Recharge',
      amount: -3.03,
      date: '12.01.2024',
      type: 'Purchase'),
  _Txn(
      title: 'PET Sale',
      subtitle: 'Bottle collection',
      amount: 72.99,
      date: '12.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Data',
      subtitle: '4GB Bundle',
      amount: -12.49,
      date: '12.01.2024',
      type: 'Purchase'),
  _Txn(
      title: 'PET Sale',
      subtitle: 'Plastic recycling',
      amount: 45.99,
      date: '12.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Withdrawal',
      subtitle: 'Bank transfer',
      amount: -20.00,
      date: '11.01.2024',
      type: 'Withdrawal'),
  _Txn(
      title: 'Airtime',
      subtitle: 'Airtel Recharge',
      amount: -5.00,
      date: '11.01.2024',
      type: 'Purchase'),
  _Txn(
      title: 'PET Sale',
      subtitle: 'Plastic recycling',
      amount: 32.99,
      date: '11.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Data',
      subtitle: '2GB Bundle',
      amount: -8.99,
      date: '11.01.2024',
      type: 'Purchase'),
  _Txn(
      title: 'PET Sale',
      subtitle: 'Bottle collection',
      amount: 61.20,
      date: '10.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Withdrawal',
      subtitle: 'Bank transfer',
      amount: -50.00,
      date: '10.01.2024',
      type: 'Withdrawal'),
  _Txn(
      title: 'Airtime',
      subtitle: 'Glo Recharge',
      amount: -2.50,
      date: '10.01.2024',
      type: 'Purchase'),
  _Txn(
      title: 'PET Sale',
      subtitle: 'Plastic recycling',
      amount: 99.99,
      date: '09.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Data',
      subtitle: '1.5GB Bundle',
      amount: -6.49,
      date: '09.01.2024',
      type: 'Purchase'),
  _Txn(
      title: 'PET Sale',
      subtitle: 'Bottle collection',
      amount: 41.75,
      date: '09.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Withdrawal',
      subtitle: 'Bank transfer',
      amount: -70.00,
      date: '08.01.2024',
      type: 'Withdrawal'),
  _Txn(
      title: 'Airtime',
      subtitle: '9mobile Recharge',
      amount: -4.00,
      date: '08.01.2024',
      type: 'Purchase'),
  _Txn(
      title: 'PET Sale',
      subtitle: 'Plastic recycling',
      amount: 120.00,
      date: '08.01.2024',
      type: 'Earning'),
  _Txn(
      title: 'Data',
      subtitle: '5GB Bundle',
      amount: -15.00,
      date: '08.01.2024',
      type: 'Purchase'),
];

class _DateRangeFilter extends StatelessWidget {
  final DateTimeRange? dateRange;
  final ValueChanged<DateTimeRange> onDateRangeChanged;
  final VoidCallback onClearDateRange;

  const _DateRangeFilter({
    required this.dateRange,
    required this.onDateRangeChanged,
    required this.onClearDateRange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => _open(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.surfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.borderSoft),
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today,
                  color: AppTheme.textSecondary, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  dateRange == null
                      ? 'Select date range'
                      : '${dateRange!.start.day}.${dateRange!.start.month}.${dateRange!.start.year} - '
                          '${dateRange!.end.day}.${dateRange!.end.month}.${dateRange!.end.year}',
                  style: TextStyle(
                    color: dateRange == null
                        ? AppTheme.textSecondary
                        : AppTheme.textPrimary,
                  ),
                ),
              ),
              if (dateRange != null)
                GestureDetector(
                  onTap: onClearDateRange,
                  child: Icon(Icons.close,
                      color: AppTheme.textSecondary, size: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _open(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AppBottomSheet(
        title: 'Filter Transactions',
        child: _DateRangePickerModal(
          initialDateRange: dateRange,
          onDateRangeChanged: onDateRangeChanged,
        ),
      ),
    );
  }
}

class _DateRangePickerModal extends StatefulWidget {
  final DateTimeRange? initialDateRange;
  final ValueChanged<DateTimeRange> onDateRangeChanged;

  const _DateRangePickerModal({
    required this.initialDateRange,
    required this.onDateRangeChanged,
  });

  @override
  State<_DateRangePickerModal> createState() => _DateRangePickerModalState();
}

class _DateRangePickerModalState extends State<_DateRangePickerModal> {
  DateTimeRange? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialDateRange;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.borderSoft),
            ),
            child: SizedBox(
              height: 400,
              child: SfDateRangePicker(
                selectionMode: DateRangePickerSelectionMode.range,
                maxDate: DateTime.now(),
                initialSelectedRange: selected == null
                    ? null
                    : PickerDateRange(selected!.start, selected!.end),
                onSelectionChanged: (args) {
                  if (args.value is PickerDateRange) {
                    final r = args.value as PickerDateRange;
                    if (r.startDate != null && r.endDate != null) {
                      setState(() {
                        selected = DateTimeRange(
                          start: r.startDate!,
                          end: r.endDate!,
                        );
                      });
                    }
                  }
                },

                backgroundColor: AppTheme.surfaceDark,

                // range colors
                startRangeSelectionColor:
                    AppTheme.primaryGreenSoft.withOpacity(0.6),
                endRangeSelectionColor:
                    AppTheme.primaryGreenSoft.withOpacity(0.6),
                rangeSelectionColor:
                    AppTheme.primaryGreenSoft.withOpacity(0.25),

                todayHighlightColor: AppTheme.primaryGreenSoft,

                selectionTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),

                // month header (dark primary)
                headerStyle: DateRangePickerHeaderStyle(
                  backgroundColor: AppTheme.primaryGreen,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                monthViewSettings: const DateRangePickerMonthViewSettings(
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: TextStyle(
                      color: AppTheme.overlayWhite,
                      fontSize: 12,
                    ),
                  ),
                ),

                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(color: AppTheme.overlayWhite),
                  todayTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  disabledDatesTextStyle: TextStyle(
                    color: AppTheme.textMuted.withOpacity(0.4),
                  ),
                  weekendTextStyle: TextStyle(
                    color: AppTheme.textSecondary.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                label: 'Clear',
                onPressed: () => setState(() => selected = null),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: PrimaryButton(
                label: 'Apply',
                onPressed: selected == null
                    ? null
                    : () {
                        widget.onDateRangeChanged(selected!);
                        Navigator.pop(context);
                      },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
