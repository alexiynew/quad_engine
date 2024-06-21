#include <iostream>

#include <quad/engine.hpp>

namespace quad
{
    Engine::Engine()
    {
        std::cout << "Engine::Engine()" << std::endl;
    }

    Engine::~Engine()
    {
        std::cout << "Engine::~Engine()" << std::endl;
    }

    void Engine::Run()
    {
        std::cout << "Engine::Run()" << std::endl;
    }

} // namespace quad
