#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

def roseFacts = [
    "Roses are members of the family Rosaceae, which also includes apples and berries.",
    "The rose is the national flower of both the United States and the United Kingdom.",
    "The oldest known fossil of a rose is 35 million years old.",
    "There are over 150 species of roses, with thousands of cultivars.",
    "The most expensive rose ever developed is the Juliet Rose, which cost \$5 million to create.",
    "Roses are edible and are used in some foods and drinks.",
    "The rose is the official flower of New York State.",
    "The largest rose bouquet ever had 156,940 roses.",
    "Ancient Egyptians used roses as perfume.",
    "In the 15th century, the rose was used as a symbol for the factions fighting the Wars of the Roses."
]

process printRose {
    output:
    stdout

    exec:
    // Full rose
    def fullRose = "\u001B[31m" + // red
        "                            __\n" +
        "                     ___  _// \\\n" +
        "                   _/   \\/__|_ \\\n" +
        "                  /  __//_/==\\_| ___\n" +
        "                / | / /|// == \\ \\   /\n" +
        "                |  | |\\|| //_\\ | |_/\n" +
        "                 \\  \\ \\\\ / \\_/| || \\\n" +
        "                  \\___/\\\\| _  ///___\\\n" +
        "                    \\__|\\_\\=//_// _\\_|\n" +
        "                       \\___\\_____/\n" +
        "                      !! \\____/\n" +
        "\u001B[32m" + //green
        "                     !!\n" +
        "                      !!\n" +
        "           ___      -(!!      __ ___ _\n" +
        "          |\\|  \\       !!_.-~~ /|\\-  \\~-._\n" +
        "          | -\\| |      !!/   /  | |\\- | |\\ \\\n" +
        "           \\__-\\|______ !!  |    \\___\\|  \\_\\|\n" +
        "     _____ _.-~/|\\     \\\\!!  \\  |  /       ~-.\n" +
        "   /     /|  / /|  \\    \\!!    \\ /          |\\~-\n" +
        " /  ---/| | |   |\\  |     !!                 \\__|\n" +
        "| ---/| | |  \\ /|  /    -(!!\n" +
        "| -/| |  /     \\|/        !!\n" +
        "|/____ /                  !!)-\n" +
        "                          !!\n" +
        "\u001B[0m" // Reset color
    
    // Split the rose into lines
    def roseLines = fullRose.split("\n")
    
    // Animate the rose growing
    for (int i = 0; i < roseLines.size(); i++) {
        print "\u001B[H\u001B[2J" // Clear screen
        println roseLines[0..i].join("\n")
        sleep(200)
    }
    
    // Print a random rose fact
    def fact = roseFacts[Math.random() * roseFacts.size() as int]
    println "\u001B[33m\nRose Fact: ${fact}\u001B[0m"
    
    // Print a rose pun
    println "\u001B[35m\nRoses are red, violets are blue,\nThis script is thorny, but it grew on you!\u001B[0m"
}

workflow {
    printRose | view
}
