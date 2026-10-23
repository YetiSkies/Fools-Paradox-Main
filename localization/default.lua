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
                        "Lose Them before Scoring" },
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
                text = { "Base Chips and Mult",
                        "are set to 1" },
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
        Enhanced={
            m_foolspara_penalty = {
                name = 'Penalty Card',
                text = {"{C:red}+#1#{} Mult",
                        "{C:blue}-#2#{} Chips"}
            },
            m_foolspara_div = {
                name = 'Divide Card',
                 text = {"{X:mult,C:white}X#1#{} Mult",
                            "{C:blue}+#2#{} Chips"},
            },
            m_foolspara_rose_gold = {
                name = 'Rose Gold Card',
                text =
                {"{C:blue}X#1#{} Chips",
                "while this card",
                "stays in hand"},
            }
        },
        Joker = {
            j_foolspara_mimic = {
                name = "Mimic",
                text = {
                    "Retrigger every",
                    "scored card {C:attention}#1#{} time"
                }
            },
            j_foolspara_athame = {
                name = "Athame",
                text = {
                    "When Blind is selected,",
                    "destroys the Joker to the right",
                    "and earns {C:money}#1#X{} its sell value"
                }
            },
            j_foolspara_black_flag = {
                name = "Black Flag",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if no",
                    "discards have been",
                    "used this round"
                }
            },
            j_foolspara_corruption = {
                name = "Corruption",
                text = {
                    "Scores a random",
                    "{X:mult,C:white} X#1# {} to {X:mult,C:white} X#2# {} Mult"
                }
            },
            j_foolspara_delusion = {
                name = "Delusion",
                text = {
                    "Scores a random",
                    "{X:chips,C:white} X#1# {} to {X:chips,C:white} X#2# {} Chips"
                }
            },
            j_foolspara_err0r = {
                name = "ERR0R",
                text = {
                    "Scores {C:chips}+#1#{} to {C:chips}+#2#{} Chips",
                    "randomly"
                }
            },
            j_foolspara_peace_sign = {
                name = "Peace Sign",
                text = {
                    "Adds {C:attention}double{} the rank",
                    "of the {C:attention}highest{} ranked card",
                    "held in hand to Mult"
                }
            },
            j_foolspara_reach_for_the_stars = {
                name = "Reach for the Stars",
                text = {
                    "Upgrades a random poker hand",
                    "by {C:attention}#1#{} level when Blind is selected.",
                    "Reverts at the end of the round."
                }
            },
            j_foolspara_anarchy = {
                name = "Anarchy",
                text = {
                    "Mult is multiplied by the",
                    "rank of the {C:attention}lowest{} ranked",
                    "card held in hand"
                }
            },
            j_foolspara_the_mad_minister = {
                name = "The Mad Minister",
                text = {
                    "All Rerolls cost {C:money}$0{}",
                    "All shop prices are {C:attention}x1.5{} higher"
                }
            },
            j_foolspara_willy_the_wild = {
                name = "Willy the Wild",
                text = {
                    "All {C:attention}Playing Cards{} that spawn",
                    "in the {C:shop}Shop{} or {C:attention}Booster Packs{}",
                    "always have the {C:attention}Wild Card{} enhancement"
                }
            },
            j_foolspara_gratuity_fee = {
                name = "Gratuity Fee",
                text = {
                    "Whenever another {C:attention}Scoring Joker{}",
                    "triggers, lose {C:money}$#1#{} and",
                    "this Joker gives {X:mult,C:white} X#2# {} Mult"
                }
            },
            j_foolspara_pastel_pete = {
                name = "Pastel Pete",
                text = {
                    "{C:mult}+#1#{} Mult and {C:chips}+#2#{} Chips",
                    "if played hand contains",
                    "{C:foolspara_bells}Bells{} or {C:foolspara_roses}Roses{}"
                }
            },
            j_foolspara_prime_pym = {
                name = "Prime Pym",
                text = {
                    "Played cards with {C:attention}Prime{} ranks",
                    "({C:attention}2, 3, 5, 7, J, K{}) give",
                    "{C:mult}+#1#{} Mult when scored"
                }
            },
            j_foolspara_earthy_earl = {
                name = "Earthy Earl",
                text = {
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "{C:foolspara_shields}Shields{} or {C:foolspara_acorns}Acorns{}"
                }
            },
            j_foolspara_bonus_bob = {
                name = "Bonus Bob",
                text = {
                    "Retrigger all played",
                    "{C:attention}Bonus{}, {C:attention}Mult{}, or",
                    "{C:red}Debuffed{} cards {C:attention}#1#{} time"
                }
            },
            j_foolspara_composite_carl = {
                name = "Composite Carl",
                text = {
                    "Played cards with {C:attention}Non-Prime{} ranks",
                    "({C:attention}4, 6, 8, 9, 10, Q, A{}) give",
                    "{C:mult}+#1#{} Mult when scored"
                }
            },
            j_foolspara_bucket_list = {
                name = "Bucket List",
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "{C:attention}unique{} poker hand",
                    "played this run",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_foolspara_blue_java = {
                name = "Blue Java",
                text = {
                    "{X:chips,C:white} X#1# {} Chips",
                    "{C:green}#2# in #3#{} chance this",
                    "card is destroyed",
                    "at end of round"
                }
            },
            j_foolspara_rath_kesel = {
                name = "Rath Kesel",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this",
                    "card is destroyed",
                    "at end of round"
                }
            },
            j_foolspara_goldfinger = {
                name = "Goldfinger",
                text = {
                    "Earn {C:money}$#1#{} at",
                    "end of round",
                    "{C:green}#2# in #3#{} chance this",
                    "card is destroyed",
                    "at end of round"
                }
            },
            j_foolspara_purple_card = {
                name = "Purple Card",
                text = {
                    "Gains {C:chips}+#1#{} Chips when a",
                    "consumable is used",
                    "while a {C:attention}Booster Pack{} is open",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_foolspara_pentagonal_joker = {
                name = "Pentagonal Joker",
                text = {
                    "Gains {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult",
                    "if played hand contains",
                    "exactly {C:attention}5{} cards",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips and {C:mult}+#4#{C:inactive} Mult)"
                }
            },
            j_foolspara_divination = {
                name = "Divination",
                text = {
                    "If played hand is a {C:attention}Spectrum{},",
                    "creates a random {C:tarot}Tarot{} card"
                }
            },
            j_foolspara_jinx = {
                name = "Jinx",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "creates a random",
                    "{C:foolspara_parallel}Parallel{} Joker"
                }
            },
            j_foolspara_fastest_route = {
                name = "Fastest Route",
                text = {
                    "{C:attention}Straights{} can be",
                    "made with {C:attention}3{} cards",
                    "{C:inactive}(ex: 2, 3, 4)"
                }
            },
            j_foolspara_crazy_8 = {
                name = "Crazy 8",
                text = {
                    "All played {C:attention}8s{} change",
                    "their {C:attention}enhancement{}",
                    "before scoring"
                }
            },
            j_foolspara_wacky_6 = {
                name = "Wacky 6",
                text = {
                    "All {C:attention}6s{} in your deck",
                    "permanently become {C:attention}Bonus{} cards",
                    "and/or {C:red}Penalty{} cards"
                }
            },
            j_foolspara_free_parking = {
                name = "Free Parking",
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "{C:attention}Face card{} held in hand",
                    "at end of round"
                }
            },
            j_foolspara_nuka_cola = {
                name = "Nuka-Cola",
                text = {
                    "Sell this card to",
                    "create a free",
                    "{C:attention}Foil Tag"
                }
            },
            j_foolspara_tigers_eye = {
                name = "Tiger's Eye",
                text = {
                    "Each scored {C:foolspara_bells}Bell{} suit",
                    "gives {X:chips,C:white} X#1# {} Chips"
                }
            },
            j_foolspara_rose_quartz = {
                name = "Rose Quartz",
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "scored {C:foolspara_roses}Rose{} suit",
                    "to give {C:mult}+#3#{} Mult"
                }
            },
            j_foolspara_sunstone = {
                name = "Sunstone",
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "scored {C:foolspara_shields}Shield{} suit",
                    "to give {C:chips}+#3#{} Chips"
                }
            },
            j_foolspara_labradorite = {
                name = "Labradorite",
                text = {
                    "Each {C:foolspara_acorns}Acorn{} suit",
                    "held in hand gives",
                    "{X:chips,C:white} X#1# {} Chips"
                }
            },
            j_foolspara_black_fire_opal = {
                name = "Black Fire Opal",
                text = {
                    "Each scored {C:attention}Wild Card{}",
                    "gives {C:money}$#1#{}, {C:chips}+#2#{} Chips,",
                    "and {C:mult}+#3#{} Mult"
                }
            },
            j_foolspara_fascimile = {
                name = "Fascimile",
                text = {
                    "Copies ability of",
                    "{C:attention}Joker{} to the left"
                }
            },
            j_foolspara_lucky_larry = {
                name = "Lucky Larry",
                text = {
                    "{C:green}#1# in #2#{} chance that",
                    "played cards turn into",
                    "{C:attention}Lucky{} cards"
                }
            },
            j_foolspara_heartbreaker = {
                name = "Heartbreaker",
                text = {
                    "Discarded {C:hearts}Heart{} cards",
                    "are destroyed.",
                    "Gains {X:mult,C:white} X#1# {} Mult",
                    "per destroyed card",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            }
        },
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
            },
            p_foolspara_pantheon_normal = {
				name = "Pantheon Pack",
				text = {
					"Choose {C:attention}1{} of up to",
					"{C:attention}2{C:spectral} Greek Planet{} cards to",
					"be used immediately",
                }
            },
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
