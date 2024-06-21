#include <gtest/gtest.h>

#include <quad/engine.hpp>

TEST(EngineTest, Run)
{
    quad::Engine game;
    game.Run();

    SUCCEED();
}

int engine(int argc, char* argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
