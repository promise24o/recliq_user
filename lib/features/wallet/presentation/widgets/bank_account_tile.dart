import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../domain/entities/bank_account.dart';

class BankAccountTile extends StatefulWidget {
  final BankAccount account;
  final VoidCallback onSetDefault;
  final VoidCallback onRemove;
  final VoidCallback? onTap;

  const BankAccountTile({
    super.key,
    required this.account,
    required this.onSetDefault,
    required this.onRemove,
    this.onTap,
  });

  @override
  State<BankAccountTile> createState() => _BankAccountTileState();
}

class _BankAccountTileState extends State<BankAccountTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expand;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    _expand = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      _expanded ? _controller.forward() : _controller.reverse();
    });
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final isDefault = widget.account.isDefault == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDefault ? AppTheme.primaryGreen : AppTheme.borderSoft,
          width: isDefault ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: _toggle,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      FontAwesomeIcons.buildingColumns,
                      size: 20,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.account.bankName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.account.accountName} • ${widget.account.maskedAccountNumber}',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 260),
                    child: const Icon(
                      Icons.expand_more,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: _expand,
              builder: (_, child) {
                return ClipRect(
                  child: Align(
                    heightFactor: _expand.value,
                    alignment: Alignment.topCenter,
                    child: child,
                  ),
                );
              },
              child: _DetailsSection(
                account: widget.account,
                isDefault: isDefault,
                onSetDefault: widget.onSetDefault,
                onRemove: widget.onRemove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsSection extends StatelessWidget {
  final BankAccount account;
  final bool isDefault;
  final VoidCallback onSetDefault;
  final VoidCallback onRemove;

  const _DetailsSection({
    required this.account,
    required this.isDefault,
    required this.onSetDefault,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.borderSoft),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          _row('Account Number', account.accountNumber),
          _row('Bank Code', account.bankCode),
          _row('Type', account.type),
          if (account.createdAt != null)
            _row('Added', _format(account.createdAt!)),
          const SizedBox(height: 16),
          Row(
            children: [
              if (!isDefault)
                Expanded(
                  child: _ActionButton(
                    label: 'Set Default',
                    icon: Icons.star_outline,
                    color: AppTheme.primaryGreen,
                    onTap: onSetDefault,
                  ),
                ),
              if (!isDefault) const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  label: 'Remove',
                  icon: Icons.delete_outline,
                  color: AppTheme.danger,
                  onTap: onRemove,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _format(DateTime d) {
    final h = d.hour % 12 == 0 ? 12 : d.hour % 12;
    final p = d.hour >= 12 ? 'PM' : 'AM';
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')} '
        '${h.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')} $p';
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18, color: color),
        label: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color.withOpacity(0.6)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
