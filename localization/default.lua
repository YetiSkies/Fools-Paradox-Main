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
                    "Retrigger each",
                    "scored card {C:attention}#1#{} time"
                }
            },
            j_foolspara_athame = {
                name = "Athame",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy {C:attention}Joker{} to the right",
                    "and earn {C:money}#1#X{} its sell value"
                }
            },
            j_foolspara_black_flag = {
                name = "Black Flag",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if {C:attention}0{}",
                    "discards have been",
                    "used this round"
                }
            },
            j_foolspara_corruption = {
                name = "Corruption",
                text = {
                    "{X:mult,C:white} X#1# {} to {X:mult,C:white} X#2# {} Mult",
                    "at random"
                }
            },
            j_foolspara_delusion = {
                name = "Delusion",
                text = {
                    "{X:chips,C:white} X#1# {} to {X:chips,C:white} X#2# {} Chips",
                    "at random"
                }
            },
            j_foolspara_err0r = {
                name = "ERR0R",
                text = {
                    "{C:chips}+#1#{} to {C:chips}+#2#{} Chips",
                    "at random"
                }
            },
            j_foolspara_peace_sign = {
                name = "Peace Sign",
                text = {
                    "Adds {C:attention}double{} the rank",
                    "of {C:attention}highest{} ranked card",
                    "held in hand to Mult"
                }
            },
            j_foolspara_reach_for_the_stars = {
                name = "Reach for the Stars",
                text = {
                    "When {C:attention}Blind{} is selected, upgrade",
                    "a random {C:attention}poker hand{} by {C:attention}#1#{} level;",
                    "resets at end of round"
                }
            },
            j_foolspara_anarchy = {
                name = "Anarchy",
                text = {
                    "Multiplies Mult by the",
                    "rank of {C:attention}lowest{} ranked",
                    "card held in hand"
                }
            },
            j_foolspara_the_mad_minister = {
                name = "The Mad Minister",
                text = {
                    "All {C:attention}Rerolls{} cost {C:money}$0{}",
                    "All shop items cost {C:attention}1.5X{} more"
                }
            },
            j_foolspara_willy_the_wild = {
                name = "Willy the Wild",
                text = {
                    "All {C:attention}playing cards{} in the",
                    "shop and {C:attention}Booster Packs{}",
                    "become {C:attention}Wild Cards{}"
                }
            },
            j_foolspara_gratuity_fee = {
                name = "Gratuity Fee",
                text = {
                    "When another {C:attention}Joker{}",
                    "scores, lose {C:money}$#1#{} and",
                    "give {X:mult,C:white} X#2# {} Mult"
                }
            },
            j_foolspara_pastel_pete = {
                name = "Pastel Pete",
                text = {
                    "{C:chips}+#2#{} Chips and {C:mult}+#1#{} Mult",
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
                    "{C:red}debuffed{} cards {C:attention}#1#{} time"
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
                    "{C:attention}unique poker hand{}",
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
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "when any {C:attention}consumable{} is used",
                    "during a {C:attention}Booster Pack{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_foolspara_pentagonal_joker = {
                name = "Pentagonal Joker",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "and {C:mult}+#2#{} Mult if played hand",
                    "contains exactly {C:attention}5{} cards",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips and {C:mult}+#4#{C:inactive} Mult)"
                }
            },
            j_foolspara_divination = {
                name = "Divination",
                text = {
                    "If played hand is a {C:attention}Spectrum{},",
                    "create a random {C:tarot}Tarot{} card",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_jinx = {
                name = "Jinx",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "create a random",
                    "{C:foolspara_parallel}Parallel{} Joker",
                    "{C:inactive}(Must have room)"
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
                    "All {C:attention}6s{} in your full deck",
                    "permanently become {C:attention}Bonus{}",
                    "or {C:attention}Penalty{} cards"
                }
            },
            j_foolspara_free_parking = {
                name = "Free Parking",
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "{C:attention}face card{} held in hand",
                    "at end of round"
                }
            },
            j_foolspara_nuka_cola = {
                name = "Nuka-Cola",
                text = {
                    "Sell this card to",
                    "create a free",
                    "{C:attention}Foil Tag{}"
                }
            },
            j_foolspara_tigers_eye = {
                name = "Tiger's Eye",
                text = {
                    "Played cards with",
                    "{C:foolspara_bells}Bell{} suit give",
                    "{X:chips,C:white} X#1# {} Chips when scored"
                }
            },
            j_foolspara_rose_quartz = {
                name = "Rose Quartz",
                text = {
                    "Played cards with",
                    "{C:foolspara_roses}Rose{} suit have",
                    "{C:green}#1# in #2#{} chance to give",
                    "{C:mult}+#3#{} Mult when scored"
                }
            },
            j_foolspara_sunstone = {
                name = "Sunstone",
                text = {
                    "Played cards with",
                    "{C:foolspara_shields}Shield{} suit have",
                    "{C:green}#1# in #2#{} chance to give",
                    "{C:chips}+#3#{} Chips when scored"
                }
            },
            j_foolspara_labradorite = {
                name = "Labradorite",
                text = {
                    "Each {C:foolspara_acorns}Acorn{} card",
                    "held in hand",
                    "gives {X:chips,C:white} X#1# {} Chips"
                }
            },
            j_foolspara_black_fire_opal = {
                name = "Black Fire Opal",
                text = {
                    "Played {C:attention}Wild Cards{} give",
                    "{C:chips}+#2#{} Chips, {C:mult}+#3#{} Mult,",
                    "and {C:money}$#1#{} when scored"
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
                    "{C:green}#1# in #2#{} chance for",
                    "played cards to become",
                    "{C:attention}Lucky Cards{}"
                }
            },
            j_foolspara_heartbreaker = {
                name = "Heartbreaker",
                text = {
                    "Destroy all discarded",
                    "{C:hearts}Heart{} cards; this Joker",
                    "gains {X:mult,C:white} X#1# {} Mult per card",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_joyfull_fragment = {
                name = "Joyfull Fragment",
                text = {
                    "Does nothing; may appear",
                    "multiple times in the shop.",
                    "Own {C:attention}4{} to destroy them and",
                    "create {C:legendary}The Joyfull One{}"
                }
            },
            j_foolspara_the_joyfull_one = {
                name = "The Joyfull One",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "Cannot be debuffed"
                }
            },
            j_foolspara_jester_template = {
                name = "Jester Template",
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "{C:attention}Joker{} card owned",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_foolspara_deuteranomaly = {
                name = "Deuteranomaly",
                text = {
                    "{C:attention}Spectrums{} can be",
                    "made with {C:attention}4{} suits"
                }
            },
            j_foolspara_loot_box = {
                name = "Loot Box",
                text = {
                    "When {C:attention}Boss Blind{} is defeated,",
                    "open a random {C:attention}Booster Pack{}"
                }
            },
            j_foolspara_dreidel = {
                name = "Dreidel",
                text = {
                    "Played {C:attention}#1#{}, {C:attention}#2#{}, {C:attention}#3#{}, or",
                    "{C:attention}most played{} rank have",
                    "{C:green}1 in 4{} chance to create a",
                    "{C:tarot}Tarot{}, {C:planet}Planet{}, or {C:attention}Tag{}.",
                    "{C:attention}Least played{} rank",
                    "creates a {C:spectral}Spectral{} card",
                    "{C:inactive}(Most: {C:attention}#4#{C:inactive}, Least: {C:attention}#5#{C:inactive})"
                }
            },
            j_foolspara_twilight = {
                name = "Twilight",
                text = {
                    "Retrigger all played cards",
                    "if hand is {C:attention}not{} the {C:attention}first{}",
                    "or {C:attention}final{} hand of round"
                }
            },
            j_foolspara_golden_ratio = {
                name = "Golden Ratio",
                text = {
                    "Retrigger each played",
                    "{C:attention}Rankless{}, {C:attention}Ace{}, {C:attention}3{}, {C:attention}6{}, {C:attention}8{}, or {C:attention}9{}"
                }
            },
            j_foolspara_rose_harlequin = {
                name = "Rose Harlequin",
                text = {
                    "Gives {X:chips,C:white} X#2# {} Chips for each",
                    "{C:attention}Rose Gold Card{} in your {C:attention}full deck{}",
                    "{C:inactive}(Currently {X:chips,C:white} X#1# {C:inactive} Chips)"
                }
            },
            j_foolspara_abstracted_fool = {
                name = "Abstracted Fool",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "for each card destroyed",
                    "this run",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_toll_of_the_bell = {
                name = "Toll of the Bell",
                text = {
                    "Retrigger all played or",
                    "held {C:foolspara_bells}Bell{} cards"
                }
            },
            j_foolspara_multi_matt = {
                name = "Multi Matt",
                text = {
                    "Retrigger all played",
                    "{C:attention}Mult{} and {C:attention}Divide{} cards"
                }
            },
            j_foolspara_poindexter = {
                name = "Poindexter",
                text = {
                    "Played {C:attention}Aces{} score {C:chips}+1{} base",
                    "Chip and give {C:mult}+#1#{} Mult",
                    "when scored"
                }
            },
            j_foolspara_hit_the_road = {
                name = "Hit the Road",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "per consecutive hand played",
                    "with a scoring {C:attention}Jack{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_parasitic_buffoon = {
                name = "Parasitic Buffoon",
                text = {
                    "{C:green}#1# in #2#{} chance to decrease",
                    "level of played {C:attention}poker hand{} by {C:attention}1{}",
                    "and upgrade {C:attention}2{} random",
                    "{C:attention}poker hands{} by {C:attention}1{} level"
                }
            },
            j_foolspara_golden_goose = {
                name = "Golden Goose",
                text = {
                    "Adds {C:money}$#1#{} of {C:attention}sell value{} to",
                    "all other {C:attention}Jokers{} at",
                    "end of round",
                    "{C:inactive}(Own sell value is always {C:money}$0{C:inactive})"
                }
            },
            j_foolspara_mastermind = {
                name = "Mastermind",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "gain {C:red}+#1#{} discards and",
                    "set hands to {C:blue}1{}.",
                    "{X:mult,C:white} X#2# {} Mult"
                }
            },
            j_foolspara_smartboard = {
                name = "Smartboard",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if all",
                    "scored cards have",
                    "{C:foolspara_parallel}Parallel{} suits"
                }
            },
            j_foolspara_runway_model = {
                name = "Runway Model",
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "and {C:mult}+#2#{} Mult if played hand",
                    "contains a {C:attention}Spectrum{}",
                    "{C:inactive}(Currently {C:chips}+#3#{C:inactive} Chips and {C:mult}+#4#{C:inactive} Mult)"
                }
            },
            j_foolspara_rainbow_sorbet = {
                name = "Rainbow Sorbet",
                text = {
                    "Gives {C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,",
                    "or {C:money}$#3#{} at random;",
                    "loses {C:chips}-#4#{} Chips, {C:mult}-#5#{} Mult,",
                    "and {C:money}-$#6#{} after hand is scored"
                }
            },
            j_foolspara_splorsh = {
                name = "Splorsh",
                text = {
                    "Cards held in hand",
                    "give {C:attention}half{} of their",
                    "base {C:chips}Chips{}"
                }
            },
            j_foolspara_magenta_joker = {
                name = "Magenta Joker",
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "card below {C:attention}52{} in",
                    "your {C:attention}full deck{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_foolspara_the_five_senses = {
                name = "The Five Senses",
                text = {
                    "If {C:attention}first hand{} of round",
                    "is a single {C:attention}5{}, destroy it",
                    "and create {C:attention}2{} random",
                    "{C:dark_edition}Negative{} {C:planet}Planet{} cards"
                }
            },
            j_foolspara_star_chart = {
                name = "Star Chart",
                text = {
                    "{C:chips}+#1#{} Chips for each",
                    "unique {C:planet}Planet{} card",
                    "used this run",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_foolspara_quarks_and_stuff = {
                name = "Quarks and Stuff",
                text = {
                    "Create a {C:planet}Planet{} card for",
                    "winning {C:attention}poker hand{}; if beaten",
                    "on {C:attention}final hand{}, create a",
                    "{C:spectral}Greek Planet{} instead"
                }
            },
            j_foolspara_ancient_oak = {
                name = "Ancient Oak",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "per consecutive hand played",
                    "with a scoring {C:foolspara_acorns}Acorn{} card",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_silver_jester = {
                name = "Silver Jester",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "for each card held in hand"
                }
            },
            j_foolspara_schrondingers_cat = {
                name = "Schrodinger's Cat",
                text = {
                    "{C:green}#1# in #2#{} chance to add",
                    "a permanent copy of each",
                    "destroyed card to your deck"
                }
            },
            j_foolspara_misplaced_marotte = {
                name = "Misplaced Marotte",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "if played hand contains",
                    "a {C:attention}Spectrum{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_foolspara_pavise = {
                name = "Pavise",
                text = {
                    "Played {C:foolspara_shields}Shield{} cards",
                    "permanently gain {C:chips}+#1#{} Chips",
                    "when scored"
                }
            },
            j_foolspara_laughing_face = {
                name = "Laughing Face",
                text = {
                    "Each played {C:attention}Ace{}, {C:attention}2{}, {C:attention}7{}, {C:attention}Jack{},",
                    "or {C:attention}Fool{} gives {C:mult}+#1#{} Mult",
                    "when scored"
                }
            },
            j_foolspara_white_whale = {
                name = "White Whale",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "add a random {C:dark_edition}Edition{} to",
                    "a {C:attention}playing card{} in your deck",
                    "without an {C:dark_edition}Edition{}"
                }
            },
            j_foolspara_rainbow = {
                name = "Rainbow",
                text = {
                    "{C:mult}+#1#{} Mult for each",
                    "unique {C:attention}suit{} in your {C:attention}full deck{}",
                    "{C:inactive}(Includes suitless cards)",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_foolspara_flower_boquete = {
                name = "Flower Boquete",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if poker hand",
                    "contains a {C:foolspara_roses}Rose{}, {C:foolspara_bells}Bell{},",
                    "{C:foolspara_acorns}Acorn{}, and {C:foolspara_shields}Shield{} card"
                }
            },
            j_foolspara_petal_joker = {
                name = "Petal Joker",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "for each scored {C:foolspara_roses}Rose{} card",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
                }
            },
            j_foolspara_sneak_eyes = {
                name = "Sneak Eyes",
                text = {
                    "Halves all {C:attention}listed",
                    "{C:green,E:1,S:1.1}probabilities",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}1 in 6{C:inactive})"
                }
            },
            j_foolspara_funhouse_mirror = {
                name = "Funhouse Mirror",
                text = {
                    "Played {C:diamonds}Diamonds{} randomly",
                    "give {C:attention}double{} or {C:attention}half{}",
                    "their base {C:chips}Chips{} when scored"
                }
            },
            j_foolspara_rodeo_clown = {
                name = "Rodeo Clown",
                text = {
                    "All {C:attention}Blinds{} require {C:attention}double{}",
                    "the chips to defeat;",
                    "{C:attention}Blinds{} give {C:attention}double{} payout"
                }
            },
            j_foolspara_saving_account = {
                name = "Saving Account",
                text = {
                    "Lose {C:attention}half{} of your final",
                    "round payout and store it here;",
                    "earn {C:money}$#2#{} at end of round",
                    "for every {C:money}$#1#{} stored",
                    "{C:inactive}(Currently {C:money}$#3#{C:inactive} stored, {C:money}+$#4#{C:inactive})"
                }
            },
            j_foolspara_mythic_grotto = {
                name = "Mythic Grotto",
                text = {
                    "Scored {C:attention}Rock{} cards change",
                    "into another random {C:attention}Rock{} card",
                    "with a random {C:attention}rank{} and {C:attention}suit{}",
                    "after scoring"
                }
            },
            j_foolspara_laugh_out_loud = {
                name = "Laugh Out Loud",
                text = {
                    "Played {C:attention}face cards{}",
                    "give {C:mult}+#1#{} Mult",
                    "when scored"
                }
            },
            j_foolspara_prosopagnosia = {
                name = "Prosopagnosia",
                text = {
                    "No cards are considered",
                    "{C:attention}face cards{}"
                }
            },
            j_foolspara_forbidden_fruit = {
                name = "Forbidden Fruit",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "Destroys itself",
                    "after {C:attention}#2#{} rounds"
                }
            },
            j_foolspara_nebula = {
                name = "Nebula",
                text = {
                    "Gives {C:mult}+Mult{} equal to",
                    "the level of played",
                    "{C:attention}poker hand{}"
                }
            },
            j_foolspara_rna = {
                name = "RNA",
                text = {
                    "If {C:attention}first discard{} of round",
                    "is only {C:attention}1{} card, {C:green}#1# in #2#{} chance",
                    "to add a permanent copy with",
                    "a random {C:dark_edition}Edition{} to hand"
                }
            },
            j_foolspara_archer = {
                name = "Archer",
                text = {
                    "Scored cards without an",
                    "{C:attention}enhancement{} become {C:attention}Bonus{}",
                    "or {C:attention}Penalty{} cards at random"
                }
            },
            j_foolspara_anonymous_fool = {
                name = "Anonymous Fool",
                text = {
                    "{C:mult}+#1#{} Mult if played hand",
                    "contains {C:attention}#2#{} or more",
                    "{C:attention}Rankless{} cards"
                }
            },
            j_foolspara_bi_color_harlequin = {
                name = "Bi-Color Harlequin",
                text = {
                    "Gains {C:mult}+#1#{} Mult and loses {C:chips}-#2#{} Chips",
                    "per hand played; gains {C:chips}+#3#{} Chips",
                    "and loses {C:mult}-#4#{} Mult per discard",
                    "{C:inactive}(Currently {C:chips}+#5#{C:inactive} Chips and {C:mult}+#6#{C:inactive} Mult)"
                }
            },
            j_foolspara_magician = {
                name = "Magician",
                text = {
                    "{X:mult,C:white} X#1# {} Mult for each",
                    "{C:attention}unique poker hand{}",
                    "played this round",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_bedlam = {
                name = "Bedlam",
                text = {
                    "Prevents using {C:attention}consumables{};",
                    "this Joker gains {X:mult,C:white} X#1# {} Mult",
                    "for each skipped {C:attention}consumable{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_miner = {
                name = "Miner",
                text = {
                    "Destroys scored {C:attention}Rock{} cards;",
                    "this Joker gains {X:mult,C:white} X#1# {} Mult",
                    "per destroyed {C:attention}Rock{} card",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_wax_replica = {
                name = "Wax Replica",
                text = {
                    "For each card destroyed,",
                    "add a permanent copy with a",
                    "random {C:attention}Seal{} to your deck"
                }
            },
            j_foolspara_enigma = {
                name = "Enigma",
                text = {
                    "Create a random {C:spectral}Spectral{} card",
                    "if hand is played while",
                    "{C:money}$#1#{} or more in debt",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_duchess = {
                name = "Duchess",
                text = {
                    "Each {C:attention}Queen{}",
                    "held in hand",
                    "gives {X:chips,C:white} X#1# {} Chips"
                }
            },
            j_foolspara_going_down = {
                name = "Going Down",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "Whenever you lose money,",
                    "lose an extra {C:money}$#2#{}"
                }
            },
            j_foolspara_midas_touch = {
                name = "Midas Touch",
                text = {
                    "{C:attention}Gold Cards{} held in hand",
                    "have a {C:green}#1# in #2#{} chance to turn",
                    "adjacent cards into {C:attention}Gold Cards{}",
                    "at end of round"
                }
            },
            j_foolspara_heel = {
                name = "Heel",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "All {C:attention}Blinds{} require {X:attention,C:white} X#2# {}",
                    "the chips to defeat"
                }
            },
            j_foolspara_landscape = {
                name = "Landscape",
                text = {
                    "Played numbered cards",
                    "score {C:attention}#1#X{} their",
                    "base {C:chips}Chips{}"
                }
            },
            j_foolspara_free_money = {
                name = "Free Money",
                text = {
                    "Costs {C:money}$0{} to buy and",
                    "has {C:money}$30{} of {C:attention}sell value{};",
                    "sell this card to destroy {C:attention}#1#{}",
                    "random cards in hand or deck"
                }
            },
            j_foolspara_black_eyed_pea = {
                name = "Black-Eyed Pea",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "gain {C:red}+#1#{} discards;",
                    "reduces by {C:red}#2#{} at end of round"
                }
            },
            j_foolspara_lima_bean = {
                name = "Lima Bean",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "gain {C:blue}+#1#{} hands;",
                    "reduces by {C:blue}#2#{} at end of round"
                }
            },
            j_foolspara_glaciation = {
                name = "Glaciation",
                text = {
                    "{C:chips}+#1#{} Chips for each",
                    "card above {C:attention}52{} in",
                    "your {C:attention}full deck{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_foolspara_royal_mail = {
                name = "Royal Mail",
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "discarded {C:attention}face card{}"
                }
            },
            j_foolspara_inflation = {
                name = "Inflation",
                text = {
                    "{C:attention}Doubles{} round payout and interest;",
                    "shop prices are {C:attention}#2#X{} higher.",
                    "If sold, shop prices are {C:attention}#3#X{}",
                    "higher for the rest of the run"
                }
            },
            j_foolspara_illusionist = {
                name = "Illusionist",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a random {C:planet}Planet{} card",
                    "when hand is scored",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_mystic = {
                name = "Mystic",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a copy of any used",
                    "{C:planet}Planet{} card",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_carnie = {
                name = "Carnie",
                text = {
                    "{C:attention}+#1#{} hand size,",
                    "{C:red}-#2#{} discard each round"
                }
            },
            j_foolspara_lush = {
                name = "Lush",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "gain {C:red}+#1#{} discards;",
                    "{C:attention}-#2#{} hand size"
                }
            },
            j_foolspara_beanie_baby = {
                name = "Beanie Baby",
                text = {
                    "Each {C:blue}Common{} Joker",
                    "gives {X:chips,C:white} X#1# {} Chips"
                }
            },
            j_foolspara_lion = {
                name = "Lion",
                text = {
                    "{C:mult}+#1#{} Mult for every",
                    "{C:money}$#2#{} you have",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)"
                }
            },
            j_foolspara_the_oracle = {
                name = "The Oracle",
                text = {
                    "If {C:attention}first discard{} of round is",
                    "a single {C:attention}Enhanced{} card, destroy it",
                    "and create a random {C:tarot}Tarot{} card",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_pop_quiz = {
                name = "Pop Quiz",
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "All {C:attention}Rerolls{} cost",
                    "{C:attention}#2#X{} as much"
                }
            },
            j_foolspara_pocket_change = {
                name = "Pocket Change",
                text = {
                    "{C:chips}+#1#{} Chips",
                    "Loses {C:chips}-#2#{} Chips",
                    "at end of round"
                }
            },
            j_foolspara_poke = {
                name = "Poke",
                text = {
                    "{X:chips,C:white} X#1# {} Chips",
                    "Loses {X:chips,C:white} X#2# {} Chips",
                    "per card scored"
                }
            },
            j_foolspara_polygraph_test = {
                name = "Polygraph Test",
                text = {
                    "Played cards with {C:attention}odd{} rank",
                    "give {C:chips}-#1#{} Chips when scored;",
                    "played cards with {C:attention}even{} rank",
                    "give {C:mult}+#2#{} Mult when scored"
                }
            },
            j_foolspara_all_or_nothing = {
                name = "All or Nothing",
                text = {
                    "Retrigger all {C:attention}face-down{}",
                    "cards {C:attention}#1#{} times"
                }
            },
            j_foolspara_oven = {
                name = "Oven",
                text = {
                    "This Joker gains {X:chips,C:white} X#1# {} Chips",
                    "for each {C:attention}consumable{} used",
                    "this round; resets at end of round",
                    "{C:inactive}(Currently {X:chips,C:white} X#2# {C:inactive} Chips)"
                }
            },
            j_foolspara_mortician = {
                name = "Mortician",
                text = {
                    "All {C:attention}Blinds{} require {C:attention}#1#X{}",
                    "the chips to defeat.",
                    "When {C:attention}Blind{} is selected, create",
                    "a random {C:spectral}Spectral{} card",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_trapeze = {
                name = "Trapeze",
                text = {
                    "{X:chips,C:white} X#1# {} Chips on {C:attention}first{}",
                    "{C:attention}hand{} of round"
                }
            },
            j_foolspara_blackbeard = {
                name = "Blackbeard",
                text = {
                    "Gives {C:chips}+Chips{} equal to {C:attention}#1#X{}",
                    "the {C:attention}sell value{} of all",
                    "other owned {C:attention}Jokers{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_foolspara_balladeer = {
                name = "Balladeer",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "gain {C:red}+#2#{} discards;",
                    "{C:attention}-#1#{} hand size"
                }
            },
            j_foolspara_mirrored_fool = {
                name = "Mirrored Fool",
                text = {
                    "Scored {C:attention}Standard{} suit cards count",
                    "as their {C:foolspara_parallel}Parallel{} counterpart",
                    "{C:inactive}({C:hearts}Hearts{C:inactive}={C:foolspara_roses}Roses{C:inactive}, {C:spades}Spades{C:inactive}={C:foolspara_shields}Shields{C:inactive},",
                    "{C:diamonds}Diamonds{C:inactive}={C:foolspara_bells}Bells{C:inactive}, {C:clubs}Clubs{C:inactive}={C:foolspara_acorns}Acorns{C:inactive})"
                }
            },
            j_foolspara_straight_ticket = {
                name = "Straight Ticket",
                text = {
                    "Retrigger all played cards",
                    "if played hand contains",
                    "{C:attention}5{} cards"
                }
            },
            j_foolspara_ringmaster = {
                name = "Ringmaster",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a copy with a random {C:dark_edition}Edition{}",
                    "when any other {C:attention}Joker{} is",
                    "sold or destroyed",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_casino_mask = {
                name = "Casino Mask",
                text = {
                    "Each played {C:attention}Ace{} of {V:1}#2#{}",
                    "gives {X:mult,C:white} X#1# {} Mult when scored",
                    "{s:0.8}Suit changes at end of round"
                }
            },
            j_foolspara_double_edged_spade = {
                name = "Double-Edged Spade",
                text = {
                    "Played {C:spades}Spades{} give their",
                    "rank value as {C:mult}+Mult{} and",
                    "{C:chips}-Chips{} when scored"
                }
            },
            j_foolspara_revolution = {
                name = "Revolution",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "for each {C:attention}face card{}",
                    "destroyed",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_starlet = {
                name = "Starlet",
                text = {
                    "{C:mult}+#1#{} Mult,",
                    "{C:attention}-#2#{} hand size"
                }
            },
            j_foolspara_build_a_buffoon = {
                name = "Build a Buffoon",
                text = {
                    "After {C:attention}#1#{} rounds, sell this",
                    "card to create a random {C:red}Rare{}",
                    "or {C:legendary}Legendary{} Joker",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)"
                }
            },
            j_foolspara_tinktank = {
                name = "Tinktank",
                text = {
                    "Copies ability of",
                    "rightmost {C:attention}Joker{}"
                }
            },
            j_foolspara_spuntik = {
                name = "Spuntik",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "for each {C:attention}unique poker hand{}",
                    "played this round",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})"
                }
            },
            j_foolspara_master_of_one = {
                name = "Master of One",
                text = {
                    "Each played {C:attention}Ace{}",
                    "gives {C:mult}+#1#{} Mult",
                    "when scored"
                }
            },
            j_foolspara_passport = {
                name = "Passport",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if at least",
                    "{C:attention}#2#{} cards in your {C:attention}full deck{}",
                    "have a {C:attention}Seal{}",
                    "{C:inactive}(Currently {C:attention}#3#{C:inactive}/#2#)"
                }
            },
            j_foolspara_horoscopist = {
                name = "Horoscopist",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "create a random {C:planet}Planet{} card",
                    "{C:inactive}(Must have room)"
                }
            },
            j_foolspara_diviner = {
                name = "Diviner",
                text = {
                    "All {C:tarot}Tarot{} cards and",
                    "{C:tarot}Arcana Packs{} in the",
                    "shop are {C:attention}free{}"
                }
            },
            j_foolspara_shocked_fool = {
                name = "Shocked Fool",
                text = {
                    "The {C:attention}poker hand{} that",
                    "defeats the {C:attention}Blind{}",
                    "gains {C:attention}#1#{} level"
                }
            },
            j_foolspara_self_made_fool = {
                name = "Self-Made Fool",
                text = {
                    "Gives {X:mult,C:white} X#1# {} Mult for",
                    "every {C:money}$#2#{} you have",
                    "{C:inactive}(Currently {X:mult,C:white} X#3# {C:inactive} Mult)"
                }
            },
            j_foolspara_cicero = {
                name = "Cicero",
                text = {
                    "All cards created by",
                    "{C:attention}Joker{} abilities gain a",
                    "random {C:dark_edition}Edition{}"
                }
            },
            j_foolspara_umlaut = {
                name = "Umlaut",
                text = {
                    "All cards played on the",
                    "{C:attention}final hand{} of round gain a",
                    "random {C:dark_edition}Edition{} after scoring",
                    "if they do not have one"
                }
            },
            j_foolspara_horatio = {
                name = "Horatio",
                text = {
                    "Defeating a {C:attention}Big Blind{} opens",
                    "a {C:planet}Celestial Pack{}; defeating a",
                    "{C:attention}Boss Blind{} opens a {C:spectral}Pantheon Pack{}"
                }
            },
            j_foolspara_trivet = {
                name = "Trivet",
                text = {
                    "Gives {X:mult,C:white} X#1# {} Mult for each",
                    "{C:attention}Joker{} to the right of this card",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)"
                }
            },
            j_foolspara_karnak = {
                name = "Karnak",
                text = {
                    "Each {C:foolspara_parallel}Parallel{} Joker",
                    "gives {X:mult,C:white} X#1# {} Mult"
                }
            }
        },
        Other={
			foolspara_parallel = {
                name = "Parallel",
                text = {}
            },
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
