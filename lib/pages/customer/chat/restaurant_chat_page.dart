import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class RestaurantChatPage extends StatefulWidget {
  const RestaurantChatPage({super.key});

  @override
  State<RestaurantChatPage> createState() => _RestaurantChatPageState();
}

class _RestaurantChatPageState extends State<RestaurantChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<_ChatMessage> _messages = [
    _ChatMessage(text: 'Welcome to Rose Garden! How can we help you?', isUser: false, time: '12:30 PM'),
    _ChatMessage(text: 'Hi, I just placed an order. Can you confirm?', isUser: true, time: '12:32 PM'),
    _ChatMessage(text: 'Yes, we received your order #RG-4521. We are preparing it now.', isUser: false, time: '12:33 PM'),
    _ChatMessage(text: 'Is my order ready for pickup?', isUser: true, time: '12:45 PM'),
    _ChatMessage(text: 'It\'s being prepared right now. Should be ready in about 10 minutes.', isUser: false, time: '12:46 PM'),
    _ChatMessage(text: 'Could you add extra sauce to my burger?', isUser: true, time: '12:48 PM'),
    _ChatMessage(text: 'Sure, we\'ll add extra sauce at no charge!', isUser: false, time: '12:48 PM'),
    _ChatMessage(text: 'Thank you so much!', isUser: true, time: '12:49 PM'),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildMessagesList()),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(42),
              ),
              child: const Icon(Icons.arrow_back, color: Color(0xFF181C2E)),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=200',
            ),
            onBackgroundImageError: (_, __) => Container(
              decoration: BoxDecoration(
                color: AppColors.grey300,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Rose Garden',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181C2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: message.isUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: message.isUser
                      ? const Color(0xFFC2033A)
                      : const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: message.isUser
                        ? const Radius.circular(16)
                        : Radius.zero,
                    bottomRight: message.isUser
                        ? Radius.zero
                        : const Radius.circular(16),
                  ),
                ),
                child: Text(
                  message.text,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: message.isUser
                        ? AppColors.white
                        : const Color(0xFF181C2E),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message.time,
                style: AppTextStyles.bodySmall.copyWith(
                    color: const Color(0xFFBDBDBD)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFFBDBDBD),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 46,
              height: 46,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: AppColors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  final String time;

  const _ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });
}
