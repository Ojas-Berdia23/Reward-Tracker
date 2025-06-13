import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Reward Dashboard',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: Container(
            margin: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/logo.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 3,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Rewards'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RewardsTab(),
            HistoryTab(),
          ],
        ),
      ),
    );
  }
}

class RewardsTab extends StatefulWidget {
  const RewardsTab({super.key});

  @override
  State<RewardsTab> createState() => _RewardsTabState();
}

class _RewardsTabState extends State<RewardsTab> with TickerProviderStateMixin {
  final int currentPoints = 84;
  late final AnimationController _lottieController75;
  late final AnimationController _lottieController100;

  @override
  void initState() {
    super.initState();
    _lottieController75 = AnimationController(vsync: this);
    _lottieController100 = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _lottieController75.dispose();
    _lottieController100.dispose();
    super.dispose();
  }

  void _onClaim(int rewardPoints, AnimationController controller) {
    if (currentPoints >= rewardPoints) {
      controller.forward(from: 0);
      // Add redeem logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('🎉 Claimed reward for $rewardPoints points!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  Widget _buildRewardCard({
    required int rewardPoints,
    required AnimationController lottieController,
  }) {
    final bool redeemable = currentPoints >= rewardPoints;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$rewardPoints Points Reward',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Lottie.asset(
              'assets/animations/redeem.json',
              controller: lottieController,
              height: 60,
              repeat: false,
              onLoaded: (composition) {
                lottieController.duration = composition.duration;
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: redeemable
                  ? () => _onClaim(rewardPoints, lottieController)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: redeemable
                    ? const Color(0xFFD4AF37)
                    : Colors.grey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                'Claim',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RewardProgressSection(currentPoints: currentPoints, goalPoints: 100),
            _buildRewardCard(
              rewardPoints: 75,
              lottieController: _lottieController75,
            ),
            _buildRewardCard(
              rewardPoints: 100,
              lottieController: _lottieController100,
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'History is empty.',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class RewardProgressSection extends StatelessWidget {
  final int currentPoints;
  final int goalPoints;

  const RewardProgressSection({
    super.key,
    required this.currentPoints,
    required this.goalPoints,
  });

  List<Widget> _buildEarnedBadges() {
    final milestones = [25, 50, 75, 100, 125];

    return milestones.map((milestone) {
      final isEarned = currentPoints >= milestone;
      return Padding(
        padding: const EdgeInsets.only(right: 12.0), // spacing between badges
        child: Opacity(
          opacity: isEarned ? 1.0 : 0.3,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/icons/badges.svg',
                height: 48,
                width: 48,
              ),
              const SizedBox(height: 4),
              Text(
                '$milestone',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final int remaining = goalPoints - currentPoints;
    final double progress = currentPoints / goalPoints;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20), // Outer margin
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Inner padding
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Badges Collected',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),

          // Horizontal badges
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildEarnedBadges(),
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Reward Progress',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$currentPoints/',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$goalPoints',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    'assets/icons/star.svg',
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '$remaining★ until your next Reward',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 14,
              backgroundColor: const Color(0xFFE0D7B1),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFD4AF37),
              ),
            ),
          ),
        ],
      ),
    );
  }
}








