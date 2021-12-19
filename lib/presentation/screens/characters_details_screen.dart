import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../business_logic/cubit/characters_cubit.dart';
import '../../data/models/quote.dart';
import '../widgets/character_info.dart';
import '../widgets/custom_sliver_appbar.dart';
import '../widgets/loading.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);
  final Character character;

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getQuotes(widget.character.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(character: widget.character),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(
                        title: 'Job : ',
                        value: widget.character.occupation.join(' / '),
                      ),
                      const BuildDivider(endIndent: 300),
                      CharacterInfo(
                        title: 'Appeared in : ',
                        value: widget.character.category,
                      ),
                      const BuildDivider(endIndent: 250),
                      CharacterInfo(
                        title: 'Seasons : ',
                        value: widget.character.appearance.join(', '),
                      ),
                      const BuildDivider(endIndent: 220),
                      CharacterInfo(
                        title: 'Status : ',
                        value: widget.character.status,
                      ),
                      const BuildDivider(endIndent: 180),
                      widget.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : CharacterInfo(
                              title: 'Better Call Saul Seasons : ',
                              value: widget.character.betterCallSaulAppearance
                                  .join(', '),
                            ),
                      widget.character.betterCallSaulAppearance.isEmpty
                          ? Container()
                          : const BuildDivider(endIndent: 150),
                      CharacterInfo(
                        title: 'Actor/Actress : ',
                        value: widget.character.portrayed,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          if (state is QuotesLoaded) {
                            var quotes = (state).quotes;
                            if (quotes.isNotEmpty) {
                              int randomQuoteIndex =
                                  Random().nextInt(quotes.length - 1);
                              return QuoteAnimation(
                                  quotes: quotes,
                                  randomQuoteIndex: randomQuoteIndex);
                            } else {
                              return Container();
                            }
                          }
                          return const Loading();
                        },
                      ),
                      const SizedBox(
                        height: 500,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class QuoteAnimation extends StatelessWidget {
  const QuoteAnimation({
    Key? key,
    required this.quotes,
    required this.randomQuoteIndex,
  }) : super(key: key);

  final List<Quote> quotes;
  final int randomQuoteIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          color: AppColors.white,
          shadows: [
            Shadow(
              blurRadius: 7,
              color: AppColors.white,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(quotes[randomQuoteIndex].quote),
          ],
        ),
      ),
    );
  }
}

class BuildDivider extends StatelessWidget {
  const BuildDivider({
    Key? key,
    required this.endIndent,
  }) : super(key: key);
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: AppColors.yellow,
      thickness: 2,
    );
  }
}
