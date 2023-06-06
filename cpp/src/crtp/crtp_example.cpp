#include <iostream>
#include <memory>
#include <string>
#include <random>

template <class T> 
class IBase {
public:
    void doSomething() {
        static_cast<T*>(this)->doSomething();
    }

};

class Derived1 : public IBase<Derived1> {
public:
    int doSomething() {
        std::cout << "Derived called\n";
        return 222;
    }
};

class Derived2 : public IBase<Derived2> {
public:
    int doSomething() {
        std::cout << "Derived2 called\n";

        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> distr(1, 100);

        return distr(gen);
    }
};

template <class TIBase>
class Controller {
public:
    Controller(std::unique_ptr<TIBase> base)
    : m_base(std::move(base)) {}

    int doSomethingNTimes(int n) {
        if (n < 0) {
            return -1;
        }

        int finalValue{};

        for (int x = 0; x < n; ++x) {
            finalValue += m_base->doSomething();
        }

        return finalValue;
    }

private:
    std::unique_ptr<TIBase> m_base;

};

class DummyBase : public IBase<DummyBase> {
public:
    int doSomething() {
        return 1;
    }
};

void TEST(bool condition, const std::string& text) {
   std::string testStatus;
   
   if (condition) {
       testStatus = "\033[1;32mPASSED\033[0m";
   } else {
       testStatus = "\033[1;31mFAILED\033[0m";
   }

   std::cout << text << ": " << testStatus << std::endl;
}

int main() {
    auto derived1 = std::unique_ptr<Derived1>(); 
    auto derived2 = std::unique_ptr<Derived2>(); 
    auto dummy = std::unique_ptr<DummyBase>(); 

    Controller<Derived1> controller1(std::move(derived1));
    Controller<Derived2> controller2(std::move(derived2));
    Controller<DummyBase> testController(std::move(dummy));

    std::string testName1 = "Testing controller doSomethingCall with value 0";
    std::string testName2 = "Testing controller doSomethingCall with value 10";
    std::string testName3 = "Testing controller doSomethingCall with value 999";
    std::string testName4 = "Testing controller doSomethingCall with value -100";
    
    TEST(testController.doSomethingNTimes(0) == 0, testName1);
    TEST(testController.doSomethingNTimes(10) == 10, testName2);
    TEST(testController.doSomethingNTimes(999) == 999, testName3);
    TEST(testController.doSomethingNTimes(-100) == -1, testName4);
    
}
