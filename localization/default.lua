return {
    descriptions = {
        Back={},
        Blind={
            bl_foolspara_deal = {
                name = "Deal",
                text = {
                },
            },
            bl_foolspara_bluff = {
                name = "Bluff",
                text = {
                },
            },
            bl_foolspara_hold_em = {
                name = "Hold'em",
                text = {
                },
            },
            bl_foolspara_rummy = {
                name = "Rummy",
                text = {},
            },
            bl_foolspara_blackjack = {
                name = "Blackjack",
                text = {},
            },
            bl_foolspara_line = {
                name = "The Line",
                text = { "Whenever you discard",
                    "Add 2 Stones to your Deck" },
            },
            bl_foolspara_caribou = {
                name = "The Caribou",
                text = { "If Most Played Hand is played",
                    "Mult is set to 0" },
            },
            bl_foolspara_tent = {
                name = "The Tent",
                text = { "All cards are drawn face down",
                    "Except after Discards" },
            },
            bl_foolspara_facade = {
                name = "The Facade",
                text = { "Gain no money on",
                    "completion of this Blind" },
            },
            bl_foolspara_anchor = {
                name = "The Anchor",
                text = { "1 in 14 cards get",
                    "destroyed when drawn" },
            },
            bl_foolspara_foot = {
                name = "The Foot",
                text = { "Scored Enhanced Cards",
                        "Lose Them" },
            },
            bl_foolspara_scepter = {
                name = "The Scepter",
                text = { "Clubs and Hearts",
                    "are debuffed" }
            },
            bl_foolspara_bowl = {
                name = "The Bowl",
                text = { "After Hand is Played",
                        "Discard Next drawn Hand" },
            },
            bl_foolspara_skeptic = {
                name = "The Skeptic",
                text = { "5 Card Hands are not allowed" },
            },
            bl_foolspara_spur = {
                name = "The Spur",
                text = { "Spades and Clubs",
                    "are Debuffed" }
            },
            bl_foolspara_lava = {
                name = "The Lava",
                text = { "Discard 3 Cards from Deck",
                        "When Playing or Discarding" },
            },
            bl_foolspara_tile = {
                name = "The Tile",
                text = { "Diamonds and Spades",
                    "are Debuffed" }
            },
            bl_foolspara_strife = {
                name = "The Strife",
                text = { "Large blind, Low payout" },
            },
            bl_foolspara_suspect = {
                name = "The Suspect",
                text = { "Cards with Seals",
                        "Are Debuffed" },
            },
            bl_foolspara_pick = {
                name = "The Pick",
                text = { "Hand Must Contain",
                        "A Non-Scoring Card" },
            },
            bl_foolspara_peak = {
                name = "The Peak",
                text = { "Cards Ranked 2-6",
                    "are Debuffed" }
            },
            bl_foolspara_changeling = {
                name = "The Changeling",
                text = { "Cards have a {C:green}#1# in #2#{} Chance",
                    "to change rank or suit" },
            },
            bl_foolspara_mast = {
                name = "The Mast",
                text = { "Raise Ante at Start",
                        "and End of the Blind" },
            },
            bl_foolspara_thread = {
                name = "The Thread",
                text = { "Must Play only High Cards" },
            },
            bl_foolspara_dome = {
                name = "The Dome",
                text = { "Hearts and Diamonds",
                    "are debuffed" }
            },
            bl_foolspara_calm = {
                name = "The Calm",
                text = { "When Scored lose 1$",
                    "Per card left in hand" },
            },
            bl_foolspara_storm = {
                name = "The Storm",
                text = { "Base Chips set to 0",
                        "Base Mult set to 1" },
            },
            bl_foolspara_liar = {
                name = "The Liar",
                text = { "Played Hand Must contain",
                        "a Face Card" },
            },
            bl_foolspara_finalclub = {
                name = "Clever Clover",
                text = { "All Ranks but 10-A",
                    "are Debuffed" },
            },
            bl_foolspara_finalwand = {
                name = "Wicked Wand",
                text = { "Scoring Hand Must Contain",
                    "A Three of a Kind" },
            },
            bl_foolspara_finalstar = {
                name = "Shining Star",
                text = { "Huge Blind",
                    "Huge Payout" },
            },
            bl_foolspara_finalspade = {
                name = "Sapphire Spade",
                text = { "Large Blind, 1 in 2",
                        "Scored cards are Destroyed" },
            },
            bl_foolspara_finaldiamond = {
                name = "Brillant Diamond",
                text = { "Rare or Better Jokers",
                        "Are Debuffed" },
            },
        },
        Edition={},
        Enhanced={},
        Joker={},
        Other={
            foolspara_light_suits = {
                name = "Light Suits",
                text = {
                    "{C:diamonds}Diamonds{}, {C:hearts}Hearts{}"
                }
            },
            foolspara_dark_suits = {
                name = "Dark Suits",
                text = {
                    "{C:spades}Spades{}, {C:clubs}Clubs{}"
                }
            },
            foolspara_standard_suits = {
                name = "Standard Suits",
                text = {
                    "{C:spades}Spades{}, {C:hearts}Hearts{}",
                    "{C:clubs}Clubs{}, {C:diamonds}Diamonds{}"
                }
            },
            foolspara_parallel_suits = {
                name = "Parallel Suits",
                text = {
                    "{C:foolspara_roses}Roses{}, {c:foolspara_shields}Shields{}",
                    "{C:foolspara_bells}Bells{}, {c:foolspara_acorns}Acorns{}"
                }
            }
        },
        Planet={
             c_foolspara_vesta = {
                name = "Vesta",
                text = {
                   "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}Null",
                    "{C:mult}+3{} Mult and",
                    "{C:chips}+40{} chips",
                },
            },
            c_foolspara_quaoar = {
                name = "Quaoar",
                -- text = {
                -- 	"{S:0.8}({S:0.8,V:1}lvl.#2#{S:0.8}){} Level up",
                -- 	"{C:attention}#1#",
                -- 	"{C:mult}+#3#{} Mult and",
                -- 	"{C:chips}+#4#{} chip#<s>4#",
                -- },
            },
            c_foolspara_haumea = {
                name = "Haumea",
                -- text = {
                -- 	"{S:0.8}({S:0.8,V:1}lvl.#2#{S:0.8}){} Level up",
                -- 	"{C:attention}#1#",
                -- 	"{C:mult}+#3#{} Mult and",
                -- 	"{C:chips}+#4#{} chip#<s>4#",
                -- },
            },
            c_foolspara_sedna = {
                name = "Sedna",
                -- text = {
                -- 	"{S:0.8}({S:0.8,V:1}lvl.#2#{S:0.8}){} Level up",
                -- 	"{C:attention}#1#",
                -- 	"{C:mult}+#3#{} Mult and",
                -- 	"{C:chips}+#4#{} chip#<s>4#",
                -- },
            },
            c_foolspara_makemake = {
                name = "Makemake",
                -- text = {
                -- 	"{S:0.8}({S:0.8,V:1}lvl.#2#{S:0.8}){} Level up",
                -- 	"{C:attention}#1#",
                -- 	"{C:mult}+#3#{} Mult and",
                -- 	"{C:chips}+#4#{} chip#<s>4#",
                -- },
            },

            c_foolspara_demeter = {
                name = "Demeter",
                text = { "Add 3 Levels to",
                        "Flush House"
                    },
            },
            c_foolspara_aletheia = {
                name = "Aletheia",
                text = { "Add 3 Levels to",
                        "Spectrum House"
                    },
            },
            c_foolspara_hestia = {
                name = "Hestia",
                text = { "Add 3 Levels to",
                        "Null"                    
                },
            },
            c_foolspara_gaia = {
                name = "Gaia",
                text = { "Add 3 Levels to",
                        "Full House"                    
                },
            },
            c_foolspara_discordia = {
                name = "Discordia",
                text = { "Add 3 Levels to",
                        "Flush Five"    
                },
            },
            c_foolspara_persephone = {
                name = "Persephone",
                text = { "Add 3 Levels to",
                        "Spectrum Five"    
                },
            },
            c_foolspara_zeus = {
                name = "Zeus",
                text = { "Add 3 Levels to",
                        "Flush"
                    },
            },
             c_foolspara_hera = {
                name = "Hera",
                text = { "Add 3 Levels to",
                        "Spectrum"
                    },
            },
            c_foolspara_ares = {
                name = "Ares",
                text = { "Add 3 Levels to",
                        "Four of a Kind"
                 },
            },
            c_foolspara_hermes = {
                name = "Hermes",
                text = { "Add 3 Levels to",
                        "Pair"
                  },
            },
            c_foolspara_amphitrite = {
                name = "Amphitrite",
                text = { "Add 3 Levels to",
                        "Straight Spectrum"
                  },
            },
            c_foolspara_poseidon = {
                name = "Poseidon",
                text = { "Add 3 Levels to",
                        "Straight Flush"
                  },
            },
            c_foolspara_nyx = {
                name = "Nyx",
                text = { "Add 3 Levels to",
                        "Five of a Kind"
                },
            },
            c_foolspara_hades = {
                name = "Hades",
                text = { "Add 3 Levels to",
                        "High Card"
                },
            },
            c_foolspara_chronos = {
                name = "Chronos",
                text = { "Add 3 Levels to",
                        "Straight"
                },
            },
            c_foolspara_caelus = {
                name = "Caelus",
                text = { "Add 3 Levels to",
                        "Two Pair"
                },
            },
            c_foolspara_aphrodite = {
                name = "Aphrodite",
                text = { "Add 3 Levels to",
                        "Three of a Kind"
                },
            },
            c_foolspara_vulcan = {
                name = "Vulcan",
                text = { "Level up all Flush Variants"
                },
            },
             c_foolspara_tyche = {
                name = "Tyche",
                text = { "Level up all Spectrum Variants"
                },
            },
             c_foolspara_theia = {
                name = "Theia",
                text = { "Level up all House Variants"
                },
            },
             c_foolspara_oceanus = {
                name = "Oceanus",
                text = { "Level up all Straight Variants"
                },
            },
             c_foolspara_bellona = {
                name = "Bellona",
                text = { "Level up all of a Kind Variants"
                },
            },
             c_foolspara_enyo = {
                name = "Enyo",
                text = { "Level up High Card, Pair,",
                        "Two Pair, and Null by 1 "
                },
            },
        },
        Spectral={},
        Stake={},
        Tag={},
        Tarot={
            c_foolspara_the_air = {
                name = "The Air",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                }

            },
            c_foolspara_the_earth = {
                name = "The Earth",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                }
            },
            c_foolspara_the_fire = {
                name = "The Fire",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                }
            },
            c_foolspara_the_water = {
                name = "The Water",
                text = {
                    "Converts up to",
                    "{C:attention}#1#{} selected cards",
                    "to {V:1}#2#{}",
                }
            },
        },
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
             foolspara_null = "Null",
            foolspara_spectrum = "Spectrum",
            foolspara_straight_spectrum = "Straight Spectrum",
            foolspara_spectrum_house = "Spectrum House",
            foolspara_spectrum_five = "Spectrum Five",
            foolspara_blaze = "Blaze",
            foolspara_straight_blaze = "Straight Blaze",
            foolspara_blaze_flush = "Blaze Flush",
            foolspara_blaze_spectrum = "Blaze Spectrum",
            k_foolspara_wild = "Wild",
            k_foolspara_light = "Light",
            k_foolspara_dark = "Dark",
            k_foolspara_standard = "Standard",
            k_foolspara_parallel = "Parallel",
            foolspara_protoplanet = "Proto-Planet",
            foolspara_theory_planet = "Theoretical Planet",
            foolspara_greek_planet = "Greek Planet",
            foolspara_greek_moon = "Greek Moon"
        },
        high_scores={},
        labels={},
        poker_hand_descriptions={
                        ['foolspara_spectrum'] = {
                "5 cards with different suits"
            },
            ['foolspara_straight_spectrum'] = {
                "5 cards in a row (consecutive ranks),",
                "each with a different suit"
            },
            ['foolspara_spectrum_house'] = {
                "A Three of a Kind and a Pair with",
                "each card having a different suit"
            },
            ['foolspara_spectrum_five'] = {
                "5 cards with the same rank,",
                "each with a different suit"
            },
            ['foolspara_null'] = {
                "5 rankless, suitless cards",
            },
            ['foolspara_blaze'] = {
                "5 unique face cards"
            },
            ['foolspara_straight_blaze'] = {
                "5 cards in a row (consecutive ranks)",
                "that are unique face cards"
            },
            ['foolspara_blaze_flush'] = {
                "5 unique face cards",
                "of the same suit"
            },
            ['foolspara_blaze_spectrum'] = {
                "5 unique face cards",
                "each wwith a differmt suit"
            }
        },
        poker_hands={
            ['foolspara_spectrum'] = "Spectrum",
            ['foolspara_straight_spectrum'] = "Straight Spectrum",
            ['foolspara_straight_spectrum_royal'] = "Royal Spectrum",
            ['foolspara_spectrum_house'] = "Spectrum House",
            ['foolspara_spectrum_five'] = "Spectrum Five",
            ['foolspara_null'] = "Null",
            ['foolspara_blaze'] = "Blaze",
            ['foolspara_straight_blaze'] = "Straight Blaze",
            ['foolspara_blaze_flush'] = "Blaze Flush",
            ['foolspara_blaze_spectrum'] = "Blaze Spectrum"
        },
        quips={},
        ranks={},
        suits_plural={
            foolspara_Roses = 'Roses',
            foolspara_Bells = 'Bells',
            foolspara_Shields = 'Shields',
            foolspara_Acorns = 'Acorns',
        },
        suits_singular={
            foolspara_Roses = 'Rose',
            foolspara_Bells = 'Bell',
            foolspara_Shields = 'Shield',
            foolspara_Acorns = 'Acorn',
        },
        tutorial={},
        v_dictionary={},
        v_text={},
    },
}