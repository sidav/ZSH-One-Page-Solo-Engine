#!/usr/bin/zsh

selectValueFromArray() {
  shuf -n 1 -e $@
}

suitDomain () {
  suits=(
    "Clubs – Physical (appearance, existence)"
    "Diamonds – Technical (mental, operation)"
    "Spades – Mystical (meaning, capability)"
    "Hearts – Social (personal, connection)"
  )
  echo "Suit domain: $(selectValueFromArray ${suits[@]})"
}

suitDomainShort () {
  suits=(
    "Physical (appearance, existence)"
    "Technical (mental, operation)"
    "Mystical (meaning, capability)"
    "Social (personal, connection)"
  )
  echo $(selectValueFromArray ${suits[@]})
}

drawCardFromArray() {
  if [[ $(shuf -n 1 -i 1-54) -gt 52 ]]
  then
    echo "JOKER (random event) + $(selectValueFromArray $@) - $(suitDomainShort)"
  else
    echo "$(selectValueFromArray $@) - $(suitDomainShort)"
  fi
}

## ORACLE

oracleYesNo() {
  yesnos=(
    "1 Not at all"
    "2 Not at all"
    "3 Unlikely"
    "4 Maybe"
    "5 Yes"
    "6 Yes, sure"
  )
  modif=(
    "but..."
    ""
    ""
    ""
    ""
    "and..."
  )

  echo "$(selectValueFromArray ${yesnos[@]}) $(selectValueFromArray ${modif[@]})"
}

oracleHow() {
  hows=(
    "1 Surprisingly lacking"
    "2 Less than expected"
    "3 About average"
    "4 About average"
    "5 More than expected"
    "6 Extraordinary"
  )
  echo "$(selectValueFromArray ${hows[@]})"
}

oracleActionFocus() {
  actions=(
  "2 Seek"
  "9 Command"
  "3 Oppose"
  "T Take"
  "4 Communicate"
  "J Protect"
  "5 Move"
  "Q Assist"
  "6 Harm"
  "K Transform"
  "7 Create"
  "A Deceive"
  "8 Reveal"
  )
  echo "$(drawCardFromArray ${actions[@]})"
}

oracleDetailFocus() {
  actions=(
    "2 Small"
    "9 Unsavory"
    "3 Large"
    "T Specialized"
    "4 Old"
    "J Unexpected"
    "5 New"
    "Q Exotic"
    "6 Mundane"
    "K Dignified"
    "7 Simple"
    "A Unique"
    "8 Complex"
  )
  echo "$(drawCardFromArray ${actions[@]})"
}

oracleTopicFocus() {
  actions=(
    "2 Current Need"
    "9 Rumors"
    "3 Allies"
    "T A Plot Arc"
    "4 Community"
    "J Recent Events"
    "5 History"
    "Q Equipment"
    "6 Future Plans"
    "K A Faction"
    "7 Enemies"
    "A The PCs"
    "8 Knowledge"
  )
  echo "$(drawCardFromArray ${actions[@]})"
}

# GM

gmPacing() {
  pacings=(
    "1 Foreshadow Trouble"
    "2 Reveal a New Detail"
    "3 An NPC Takes Action"
    "4 Advance a Threat"
    "5 Advance a Plot"
    "6 Add a RANDOM EVENT to the scene"
  )
  echo "$(selectValueFromArray ${pacings[@]})"
}

gmFailure() {
  failures=(
    "1 Cause Harm"
    "2 Put Someone in a Spot"
    "3 Offer a Choice"
    "4 Advance a Threat"
    "5 Reveal an Unwelcome Truth"
    "6 Foreshadow Trouble"
  )
  echo "$(selectValueFromArray ${failures[@]})"
}

# OTHERS

sceneComplication () {
  compArr=(
    "1 Hostile forces oppose you"
    "2 An obstacle blocks your way"
    "3 Wouldn’t it suck if…"
    "4 An NPC acts suddenly"
    "5 All is not as is seems"
    "6 Things actually go as planned"
  )
  echo "Scene complication: $(selectValueFromArray ${compArr[@]})"
}

alteredScene () {
  as=(
    "1 A major detail of the scene is enhanced or somehow worse"
    "2 The environment is different"
    "3 Unexpected NPCs are present"
    "4 Add a SCENE COMPLICATION"
    "5 Add a PACING MOVE"
    "6 Add a RANDOM EVENT"
  )
  echo "Altered scene: $(selectValueFromArray ${as[@]})"
}

# COMPLEX GENERATORS

plotHook () {
  echo "=== PLOT HOOK ==="
  objectiveArr=(
    "1 Eliminate a threat"
    "2 Learn the truth"
    "3 Recover something valuable"
    "4 Escort or deliver to safety"
    "5 Restore something broken"
    "6 Save an ally in peril"
  )
  echo " Objective: $(selectValueFromArray ${objectiveArr[@]})"

  adversariesArr=(
    "1 A powerful organization"
    "2 Outlaws"
    "3 Guardians"
    "4 Local inhabitants"
    "5 Enemy horde or force"
    "6 A new or recurring villain"
  )
  echo " Adversaries: $(selectValueFromArray ${adversariesArr[@]})"
  rewardsArr=(
    "1 Money or valuables"
    "2 Money or valuables"
    "3 Knowledge and secrets"
    "4 Support of an ally"
    "5 Advance a plot arc"
    "6 A unique item of power"
  )
  echo " Reward: $(selectValueFromArray ${rewardsArr[@]})"
}

npcGenerator() {
  echo "=== NPC GENERATOR ==="
  id=(
    "2 Outlaw"
    "3 Drifter"
    "4 Tradesman"
    "5 Commoner"
    "6 Soldier"
    "7 Merchant"
    "8 Specialist"
    "9 Entertainer"
    "10 Adherent"
    "J Leader"
    "Q Mystic"
    "K Adventurer"
    "A Lord"
  )
  echo " Identity: $(drawCardFromArray ${id[@]})"

  goals=(
    "2 Obtain"
    "3 Learn"
    "4 Harm"
    "5 Restore"
    "6 Find"
    "7 Travel"
    "8 Protect"
    "9 Enrich Self"
    "10 Avenge"
    "J Fulfill Duty"
    "Q Escape"
    "K Create"
    "A Serve"
  )
  echo " Goal: $(drawCardFromArray ${goals[@]})"

  notables=(
    "1 Unremarkable"
    "2 Notable nature"
    "3 Obvious physical trait"
    "4 Quirk or mannerism"
    "5 Unusual equipment"
    "6 Unexpected age or origin"
  )
  echo " Notable: $(selectValueFromArray ${notables[@]})"
  echo "   descr.: $(oracleDetailFocus)"
  echo " Current situation: "
  echo "  Attitude to PCs: $(oracleHow)"
  echo "  Conversation: $(oracleTopicFocus)"
}

randomEvent() {
  echo "=== RANDOM EVENT ==="
  echo " What happens: $(oracleActionFocus)"
  echo " Involving: $(oracleTopicFocus)"
}

genericGenerator() {
  echo "=== GENERIC GENERATOR ==="
  echo " What it does: $(oracleActionFocus)"
  echo " How it looks: $(oracleDetailFocus)"
  echo " How significant: $(oracleHow)"
}

# CRAWLERS

dungeonCrawler() {
  echo "=== DUNGEON CRAWLER ==="
  echo "Dungeon theme: "
  echo " How it looks: $(oracleDetailFocus)"
  echo " How it is used: $(oracleActionFocus)"
  echo "Location: $()"
  echo "Encounter: $()"
  echo "Object: $()"
  echo "Total exits: $()"
}

hexCrawler() {
  echo "=== HEX CRAWLER ==="
  echo "Terrain: $()"
  echo "Contents: $()"
  echo "Features: $()"
  echo "Events: $()"
}

start() {
  plotHook
  randomEvent
  echo "=== SCENE COMPLICATION ==="
  sceneComplication
}

showOpseHelp() {
  echo "1	Create one or more characters using your chosen game system."
  echo "2	Roll a starting PLOT HOOK and a RANDOM EVENT, then SET THE SCENE."
  echo "3	Start asking the ORACLE questions.  Interpret the answers in context."
  echo "4	Play the game to overcome the challenges of the scene."
  echo "5	Use GM MOVES to move the action."
  echo "6	SET THE SCENE for the next thing you want your character to do."
}

showHelp() {
  echo "What do you will?"
  echo "[Start]"
  echo "[O]racle, [GM], [S]cene"
  echo "[P]lot Hook and random event"
  echo "Generators: [N]PC or [G]eneric"
  echo "[C]rawlers"
}

showHelp

for (( ; ; ))
do
  echo -n "> "
  read -r input
  case $input in
    start)
      start
      ;;
    o)
      echo "= ORACLE ="
      echo " Yes/no: $(oracleYesNo)"
      echo " How: $(oracleHow)"
      echo " Action focus: $(oracleActionFocus)"
      echo " Detail focus: $(oracleDetailFocus)"
      echo " Topic focus: $(oracleTopicFocus)"
      ;;
    gm)
      echo "= GM ="
      echo " GM Pacing: $(gmPacing)"
      echo " GM Failure: $(gmFailure)"
      ;;
    s)
      echo "= SCENE SETUP ="
      echo " $(sceneComplication)"
      if [[ $(shuf -n 1 -i 1-6) -gt 4 ]]
      then
        echo " $(alteredScene)"
      else
        echo " No altered scene"
      fi
      ;;
    p)
      plotHook
      randomEvent
      ;;
    n)
      npcGenerator
      ;;
    g)
      genericGenerator
      ;;
    c)
      echo "= CRAWLERS ="
      echo "Not implemented"
      #dungeonCrawler
      #hexCrawler
      ;;
    opse)

      ;;
    clr)
      tput reset
      ;;
    help)
      showHelp
      ;;
    exit)
      break
      ;;
    *)
      echo " UNRECOGNIZED: $input. Maybe type 'help' or 'opse'? "
      ;;
  esac
done
