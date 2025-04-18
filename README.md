#  Interview Live Coding Test

In [TodoViewModel](Interview/TodoViewModel.swift) `fetch()` I am attempting to download from https://jsonplaceholder.typicode.com/todos/ but it is failing with a timeout:

    Printing description of error:
    ▿ URLError
      - _nsError : Error Domain=NSURLErrorDomain Code=-1001 "The request timed out." UserInfo={_kCFStreamErrorCodeKey=-2102, NSUnderlyingError=0x600000c287e0 {Error Domain=kCFErrorDomainCFNetwork Code=-1001 "(null)" UserInfo={_kCFStreamErrorCodeKey=-2102, _kCFStreamErrorDomainKey=4}}, _NSURLErrorFailingURLSessionTaskErrorKey=LocalDataTask <2068260F-ECA8-4AF4-910C-D9FD3C06E947>.<1>, _NSURLErrorRelatedURLSessionTaskErrorKey=(
    "LocalDataTask <2068260F-ECA8-4AF4-910C-D9FD3C06E947>.<1>"
    ), NSLocalizedDescription=The request timed out., NSErrorFailingURLStringKey=https://jsonplaceholder.typicode.com/todos/, NSErrorFailingURLKey=https://jsonplaceholder.typicode.com/todos/, _kCFStreamErrorDomainKey=4}

This URL works beautifully if I call it from Chrome on my Mac or Safari in the iOS Simulator, but if I try to call it from my app it fails with a timeout.

What am I doing wrong?
