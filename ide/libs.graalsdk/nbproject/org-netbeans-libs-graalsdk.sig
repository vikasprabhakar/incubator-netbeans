#Signature file v4.1
#Version 1.0.11

CLSS public abstract interface java.io.Serializable

CLSS public abstract interface java.lang.AutoCloseable
meth public abstract void close() throws java.lang.Exception

CLSS public abstract interface java.lang.Comparable<%0 extends java.lang.Object>
meth public abstract int compareTo({java.lang.Comparable%0})

CLSS public abstract interface !annotation java.lang.Deprecated
 anno 0 java.lang.annotation.Documented()
 anno 0 java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy value=RUNTIME)
 anno 0 java.lang.annotation.Target(java.lang.annotation.ElementType[] value=[CONSTRUCTOR, FIELD, LOCAL_VARIABLE, METHOD, PACKAGE, PARAMETER, TYPE])
intf java.lang.annotation.Annotation

CLSS public abstract java.lang.Enum<%0 extends java.lang.Enum<{java.lang.Enum%0}>>
cons protected init(java.lang.String,int)
intf java.io.Serializable
intf java.lang.Comparable<{java.lang.Enum%0}>
meth protected final java.lang.Object clone() throws java.lang.CloneNotSupportedException
meth protected final void finalize()
meth public final boolean equals(java.lang.Object)
meth public final int compareTo({java.lang.Enum%0})
meth public final int hashCode()
meth public final int ordinal()
meth public final java.lang.Class<{java.lang.Enum%0}> getDeclaringClass()
meth public final java.lang.String name()
meth public java.lang.String toString()
meth public static <%0 extends java.lang.Enum<{%%0}>> {%%0} valueOf(java.lang.Class<{%%0}>,java.lang.String)
supr java.lang.Object
hfds name,ordinal

CLSS public java.lang.Exception
cons protected init(java.lang.String,java.lang.Throwable,boolean,boolean)
cons public init()
cons public init(java.lang.String)
cons public init(java.lang.String,java.lang.Throwable)
cons public init(java.lang.Throwable)
supr java.lang.Throwable
hfds serialVersionUID

CLSS public abstract interface !annotation java.lang.FunctionalInterface
 anno 0 java.lang.annotation.Documented()
 anno 0 java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy value=RUNTIME)
 anno 0 java.lang.annotation.Target(java.lang.annotation.ElementType[] value=[TYPE])
intf java.lang.annotation.Annotation

CLSS public abstract interface java.lang.Iterable<%0 extends java.lang.Object>
meth public abstract java.util.Iterator<{java.lang.Iterable%0}> iterator()
meth public java.util.Spliterator<{java.lang.Iterable%0}> spliterator()
meth public void forEach(java.util.function.Consumer<? super {java.lang.Iterable%0}>)

CLSS public java.lang.Object
cons public init()
meth protected java.lang.Object clone() throws java.lang.CloneNotSupportedException
meth protected void finalize() throws java.lang.Throwable
meth public boolean equals(java.lang.Object)
meth public final java.lang.Class<?> getClass()
meth public final void notify()
meth public final void notifyAll()
meth public final void wait() throws java.lang.InterruptedException
meth public final void wait(long) throws java.lang.InterruptedException
meth public final void wait(long,int) throws java.lang.InterruptedException
meth public int hashCode()
meth public java.lang.String toString()

CLSS public java.lang.RuntimeException
cons protected init(java.lang.String,java.lang.Throwable,boolean,boolean)
cons public init()
cons public init(java.lang.String)
cons public init(java.lang.String,java.lang.Throwable)
cons public init(java.lang.Throwable)
supr java.lang.Exception
hfds serialVersionUID

CLSS public java.lang.Throwable
cons protected init(java.lang.String,java.lang.Throwable,boolean,boolean)
cons public init()
cons public init(java.lang.String)
cons public init(java.lang.String,java.lang.Throwable)
cons public init(java.lang.Throwable)
intf java.io.Serializable
meth public final java.lang.Throwable[] getSuppressed()
meth public final void addSuppressed(java.lang.Throwable)
meth public java.lang.StackTraceElement[] getStackTrace()
meth public java.lang.String getLocalizedMessage()
meth public java.lang.String getMessage()
meth public java.lang.String toString()
meth public java.lang.Throwable fillInStackTrace()
meth public java.lang.Throwable getCause()
meth public java.lang.Throwable initCause(java.lang.Throwable)
meth public void printStackTrace()
meth public void printStackTrace(java.io.PrintStream)
meth public void printStackTrace(java.io.PrintWriter)
meth public void setStackTrace(java.lang.StackTraceElement[])
supr java.lang.Object
hfds CAUSE_CAPTION,EMPTY_THROWABLE_ARRAY,NULL_CAUSE_MESSAGE,SELF_SUPPRESSION_MESSAGE,SUPPRESSED_CAPTION,SUPPRESSED_SENTINEL,UNASSIGNED_STACK,backtrace,cause,detailMessage,serialVersionUID,stackTrace,suppressedExceptions
hcls PrintStreamOrWriter,SentinelHolder,WrappedPrintStream,WrappedPrintWriter

CLSS public abstract interface java.lang.annotation.Annotation
meth public abstract boolean equals(java.lang.Object)
meth public abstract int hashCode()
meth public abstract java.lang.Class<? extends java.lang.annotation.Annotation> annotationType()
meth public abstract java.lang.String toString()

CLSS public abstract interface !annotation java.lang.annotation.Documented
 anno 0 java.lang.annotation.Documented()
 anno 0 java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy value=RUNTIME)
 anno 0 java.lang.annotation.Target(java.lang.annotation.ElementType[] value=[ANNOTATION_TYPE])
intf java.lang.annotation.Annotation

CLSS public abstract interface !annotation java.lang.annotation.Retention
 anno 0 java.lang.annotation.Documented()
 anno 0 java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy value=RUNTIME)
 anno 0 java.lang.annotation.Target(java.lang.annotation.ElementType[] value=[ANNOTATION_TYPE])
intf java.lang.annotation.Annotation
meth public abstract java.lang.annotation.RetentionPolicy value()

CLSS public abstract interface !annotation java.lang.annotation.Target
 anno 0 java.lang.annotation.Documented()
 anno 0 java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy value=RUNTIME)
 anno 0 java.lang.annotation.Target(java.lang.annotation.ElementType[] value=[ANNOTATION_TYPE])
intf java.lang.annotation.Annotation
meth public abstract java.lang.annotation.ElementType[] value()

CLSS public final !enum org.graalvm.options.OptionCategory
fld public final static org.graalvm.options.OptionCategory DEBUG
fld public final static org.graalvm.options.OptionCategory EXPERT
fld public final static org.graalvm.options.OptionCategory USER
meth public static org.graalvm.options.OptionCategory valueOf(java.lang.String)
meth public static org.graalvm.options.OptionCategory[] values()
supr java.lang.Enum<org.graalvm.options.OptionCategory>

CLSS public final org.graalvm.options.OptionDescriptor
innr public final Builder
meth public boolean equals(java.lang.Object)
meth public boolean isDeprecated()
meth public int hashCode()
meth public java.lang.String getHelp()
meth public java.lang.String getName()
meth public java.lang.String toString()
meth public org.graalvm.options.OptionCategory getCategory()
meth public org.graalvm.options.OptionKey<?> getKey()
meth public static <%0 extends java.lang.Object> org.graalvm.options.OptionDescriptor$Builder newBuilder(org.graalvm.options.OptionKey<{%%0}>,java.lang.String)
supr java.lang.Object
hfds EMPTY,deprecated,help,key,kind,name

CLSS public final org.graalvm.options.OptionDescriptor$Builder
 outer org.graalvm.options.OptionDescriptor
meth public org.graalvm.options.OptionDescriptor build()
meth public org.graalvm.options.OptionDescriptor$Builder category(org.graalvm.options.OptionCategory)
meth public org.graalvm.options.OptionDescriptor$Builder deprecated(boolean)
meth public org.graalvm.options.OptionDescriptor$Builder help(java.lang.String)
supr java.lang.Object
hfds category,deprecated,help,key,name

CLSS public abstract interface org.graalvm.options.OptionDescriptors
fld public final static org.graalvm.options.OptionDescriptors EMPTY
intf java.lang.Iterable<org.graalvm.options.OptionDescriptor>
meth public !varargs static org.graalvm.options.OptionDescriptors createUnion(org.graalvm.options.OptionDescriptors[])
meth public abstract java.util.Iterator<org.graalvm.options.OptionDescriptor> iterator()
meth public abstract org.graalvm.options.OptionDescriptor get(java.lang.String)
meth public static org.graalvm.options.OptionDescriptors create(java.util.List<org.graalvm.options.OptionDescriptor>)

CLSS public final org.graalvm.options.OptionKey<%0 extends java.lang.Object>
cons public init({org.graalvm.options.OptionKey%0})
cons public init({org.graalvm.options.OptionKey%0},org.graalvm.options.OptionType<{org.graalvm.options.OptionKey%0}>)
meth public boolean hasBeenSet(org.graalvm.options.OptionValues)
meth public org.graalvm.options.OptionType<{org.graalvm.options.OptionKey%0}> getType()
meth public {org.graalvm.options.OptionKey%0} getDefaultValue()
meth public {org.graalvm.options.OptionKey%0} getValue(org.graalvm.options.OptionValues)
supr java.lang.Object
hfds defaultValue,type

CLSS public final org.graalvm.options.OptionType<%0 extends java.lang.Object>
cons public init(java.lang.String,{org.graalvm.options.OptionType%0},java.util.function.Function<java.lang.String,{org.graalvm.options.OptionType%0}>)
cons public init(java.lang.String,{org.graalvm.options.OptionType%0},java.util.function.Function<java.lang.String,{org.graalvm.options.OptionType%0}>,java.util.function.Consumer<{org.graalvm.options.OptionType%0}>)
meth public java.lang.String getName()
meth public java.lang.String toString()
meth public static <%0 extends java.lang.Object> org.graalvm.options.OptionType<{%%0}> defaultType(java.lang.Class<{%%0}>)
meth public static <%0 extends java.lang.Object> org.graalvm.options.OptionType<{%%0}> defaultType({%%0})
meth public void validate({org.graalvm.options.OptionType%0})
meth public {org.graalvm.options.OptionType%0} convert(java.lang.String)
meth public {org.graalvm.options.OptionType%0} getDefaultValue()
supr java.lang.Object
hfds DEFAULTTYPES,defaultValue,name,stringConverter,validator

CLSS public abstract interface org.graalvm.options.OptionValues
meth public abstract <%0 extends java.lang.Object> void set(org.graalvm.options.OptionKey<{%%0}>,{%%0})
meth public abstract <%0 extends java.lang.Object> {%%0} get(org.graalvm.options.OptionKey<{%%0}>)
meth public abstract boolean hasBeenSet(org.graalvm.options.OptionKey<?>)
meth public abstract org.graalvm.options.OptionDescriptors getDescriptors()
meth public boolean hasSetOptions()

CLSS public final org.graalvm.polyglot.Context
innr public final Builder
intf java.lang.AutoCloseable
meth public !varargs static org.graalvm.polyglot.Context create(java.lang.String[])
meth public !varargs static org.graalvm.polyglot.Context$Builder newBuilder(java.lang.String[])
meth public boolean initialize(java.lang.String)
meth public org.graalvm.polyglot.Engine getEngine()
meth public org.graalvm.polyglot.Value asValue(java.lang.Object)
meth public org.graalvm.polyglot.Value eval(java.lang.String,java.lang.CharSequence)
meth public org.graalvm.polyglot.Value eval(org.graalvm.polyglot.Source)
meth public org.graalvm.polyglot.Value getBindings(java.lang.String)
meth public org.graalvm.polyglot.Value getPolyglotBindings()
meth public static org.graalvm.polyglot.Context getCurrent()
meth public void close()
meth public void close(boolean)
meth public void enter()
meth public void leave()
supr java.lang.Object
hfds EMPTY,impl

CLSS public final org.graalvm.polyglot.Context$Builder
 outer org.graalvm.polyglot.Context
meth public org.graalvm.polyglot.Context build()
meth public org.graalvm.polyglot.Context$Builder allowAllAccess(boolean)
meth public org.graalvm.polyglot.Context$Builder allowCreateThread(boolean)
meth public org.graalvm.polyglot.Context$Builder allowHostAccess(boolean)
meth public org.graalvm.polyglot.Context$Builder allowHostClassLoading(boolean)
meth public org.graalvm.polyglot.Context$Builder allowIO(boolean)
meth public org.graalvm.polyglot.Context$Builder allowNativeAccess(boolean)
meth public org.graalvm.polyglot.Context$Builder arguments(java.lang.String,java.lang.String[])
meth public org.graalvm.polyglot.Context$Builder engine(org.graalvm.polyglot.Engine)
meth public org.graalvm.polyglot.Context$Builder err(java.io.OutputStream)
meth public org.graalvm.polyglot.Context$Builder fileSystem(org.graalvm.polyglot.io.FileSystem)
meth public org.graalvm.polyglot.Context$Builder hostClassFilter(java.util.function.Predicate<java.lang.String>)
meth public org.graalvm.polyglot.Context$Builder in(java.io.InputStream)
meth public org.graalvm.polyglot.Context$Builder logHandler(java.io.OutputStream)
meth public org.graalvm.polyglot.Context$Builder logHandler(java.util.logging.Handler)
meth public org.graalvm.polyglot.Context$Builder option(java.lang.String,java.lang.String)
meth public org.graalvm.polyglot.Context$Builder options(java.util.Map<java.lang.String,java.lang.String>)
meth public org.graalvm.polyglot.Context$Builder out(java.io.OutputStream)
meth public org.graalvm.polyglot.Context$Builder serverTransport(org.graalvm.polyglot.io.MessageTransport)
supr java.lang.Object
hfds allowAllAccess,allowCreateThread,allowHostAccess,allowHostClassLoading,allowIO,allowNativeAccess,arguments,customFileSystem,customLogHandler,err,hostClassFilter,in,messageTransport,onlyLanguages,options,out,sharedEngine

CLSS public final org.graalvm.polyglot.Engine
innr public final Builder
intf java.lang.AutoCloseable
meth public java.lang.String getImplementationName()
meth public java.lang.String getVersion()
meth public java.util.Map<java.lang.String,org.graalvm.polyglot.Instrument> getInstruments()
meth public java.util.Map<java.lang.String,org.graalvm.polyglot.Language> getLanguages()
meth public org.graalvm.options.OptionDescriptors getOptions()
meth public static java.nio.file.Path findHome()
meth public static org.graalvm.polyglot.Engine create()
meth public static org.graalvm.polyglot.Engine$Builder newBuilder()
meth public void close()
meth public void close(boolean)
supr java.lang.Object
hfds EMPTY,JDK8_OR_EARLIER,impl
hcls APIAccessImpl,ImplHolder,PolyglotInvalid

CLSS public final org.graalvm.polyglot.Engine$Builder
 outer org.graalvm.polyglot.Engine
meth public org.graalvm.polyglot.Engine build()
meth public org.graalvm.polyglot.Engine$Builder err(java.io.OutputStream)
meth public org.graalvm.polyglot.Engine$Builder in(java.io.InputStream)
meth public org.graalvm.polyglot.Engine$Builder logHandler(java.io.OutputStream)
meth public org.graalvm.polyglot.Engine$Builder logHandler(java.util.logging.Handler)
meth public org.graalvm.polyglot.Engine$Builder option(java.lang.String,java.lang.String)
meth public org.graalvm.polyglot.Engine$Builder options(java.util.Map<java.lang.String,java.lang.String>)
meth public org.graalvm.polyglot.Engine$Builder out(java.io.OutputStream)
meth public org.graalvm.polyglot.Engine$Builder serverTransport(org.graalvm.polyglot.io.MessageTransport)
meth public org.graalvm.polyglot.Engine$Builder useSystemProperties(boolean)
supr java.lang.Object
hfds boundEngine,customLogHandler,err,in,messageTransport,options,out,useSystemProperties

CLSS public final org.graalvm.polyglot.Instrument
meth public <%0 extends java.lang.Object> {%%0} lookup(java.lang.Class<{%%0}>)
meth public java.lang.String getId()
meth public java.lang.String getName()
meth public java.lang.String getVersion()
meth public org.graalvm.options.OptionDescriptors getOptions()
supr java.lang.Object
hfds impl

CLSS public final org.graalvm.polyglot.Language
meth public boolean isInteractive()
meth public java.lang.String getDefaultMimeType()
meth public java.lang.String getId()
meth public java.lang.String getImplementationName()
meth public java.lang.String getName()
meth public java.lang.String getVersion()
meth public java.util.Set<java.lang.String> getMimeTypes()
meth public org.graalvm.options.OptionDescriptors getOptions()
supr java.lang.Object
hfds impl

CLSS public final org.graalvm.polyglot.PolyglotException
innr public final StackFrame
meth public boolean equals(java.lang.Object)
meth public boolean isCancelled()
meth public boolean isExit()
meth public boolean isGuestException()
meth public boolean isHostException()
meth public boolean isIncompleteSource()
meth public boolean isInternalError()
meth public boolean isSyntaxError()
meth public int getExitStatus()
meth public int hashCode()
meth public java.lang.Iterable<org.graalvm.polyglot.PolyglotException$StackFrame> getPolyglotStackTrace()
meth public java.lang.StackTraceElement[] getStackTrace()
meth public java.lang.String getMessage()
meth public java.lang.Throwable asHostException()
meth public java.lang.Throwable fillInStackTrace()
meth public org.graalvm.polyglot.SourceSection getSourceLocation()
meth public org.graalvm.polyglot.Value getGuestObject()
meth public void printStackTrace()
meth public void printStackTrace(java.io.PrintStream)
meth public void printStackTrace(java.io.PrintWriter)
meth public void setStackTrace(java.lang.StackTraceElement[])
supr java.lang.RuntimeException
hfds impl

CLSS public final org.graalvm.polyglot.PolyglotException$StackFrame
 outer org.graalvm.polyglot.PolyglotException
meth public boolean isGuestFrame()
meth public boolean isHostFrame()
meth public java.lang.StackTraceElement toHostFrame()
meth public java.lang.String getRootName()
meth public java.lang.String toString()
meth public org.graalvm.polyglot.Language getLanguage()
meth public org.graalvm.polyglot.SourceSection getSourceLocation()
supr java.lang.Object
hfds impl

CLSS public final org.graalvm.polyglot.Source
innr public Builder
meth public boolean equals(java.lang.Object)
meth public boolean hasBytes()
meth public boolean hasCharacters()
meth public boolean isInteractive()
meth public boolean isInternal()
meth public int getColumnNumber(int)
meth public int getLength()
meth public int getLineCount()
meth public int getLineLength(int)
meth public int getLineNumber(int)
meth public int getLineStartOffset(int)
meth public int hashCode()
meth public java.io.InputStream getInputStream()
 anno 0 java.lang.Deprecated()
meth public java.io.Reader getReader()
meth public java.lang.CharSequence getCharacters()
meth public java.lang.CharSequence getCharacters(int)
meth public java.lang.String getLanguage()
meth public java.lang.String getMimeType()
meth public java.lang.String getName()
meth public java.lang.String getPath()
meth public java.lang.String toString()
meth public java.net.URI getURI()
meth public java.net.URL getURL()
meth public org.graalvm.polyglot.io.ByteSequence getBytes()
meth public static java.lang.String findLanguage(java.io.File) throws java.io.IOException
meth public static java.lang.String findLanguage(java.lang.String)
meth public static java.lang.String findLanguage(java.net.URL) throws java.io.IOException
meth public static java.lang.String findMimeType(java.io.File) throws java.io.IOException
meth public static java.lang.String findMimeType(java.net.URL) throws java.io.IOException
meth public static org.graalvm.polyglot.Source create(java.lang.String,java.lang.CharSequence)
meth public static org.graalvm.polyglot.Source$Builder newBuilder(java.lang.String,java.io.File)
meth public static org.graalvm.polyglot.Source$Builder newBuilder(java.lang.String,java.io.Reader,java.lang.String)
meth public static org.graalvm.polyglot.Source$Builder newBuilder(java.lang.String,java.lang.CharSequence,java.lang.String)
meth public static org.graalvm.polyglot.Source$Builder newBuilder(java.lang.String,java.net.URL)
meth public static org.graalvm.polyglot.Source$Builder newBuilder(java.lang.String,org.graalvm.polyglot.io.ByteSequence,java.lang.String)
supr java.lang.Object
hfds EMPTY,IMPL,impl,language

CLSS public org.graalvm.polyglot.Source$Builder
 outer org.graalvm.polyglot.Source
meth public org.graalvm.polyglot.Source build() throws java.io.IOException
meth public org.graalvm.polyglot.Source buildLiteral()
meth public org.graalvm.polyglot.Source$Builder cached(boolean)
meth public org.graalvm.polyglot.Source$Builder content(java.lang.CharSequence)
meth public org.graalvm.polyglot.Source$Builder content(java.lang.String)
meth public org.graalvm.polyglot.Source$Builder content(org.graalvm.polyglot.io.ByteSequence)
meth public org.graalvm.polyglot.Source$Builder interactive(boolean)
meth public org.graalvm.polyglot.Source$Builder internal(boolean)
meth public org.graalvm.polyglot.Source$Builder mimeType(java.lang.String)
meth public org.graalvm.polyglot.Source$Builder name(java.lang.String)
meth public org.graalvm.polyglot.Source$Builder uri(java.net.URI)
supr java.lang.Object
hfds cached,content,interactive,internal,language,mimeType,name,origin,uri

CLSS public final org.graalvm.polyglot.SourceSection
meth public boolean equals(java.lang.Object)
meth public boolean hasCharIndex()
meth public boolean hasColumns()
meth public boolean hasLines()
meth public boolean isAvailable()
meth public int getCharEndIndex()
meth public int getCharIndex()
meth public int getCharLength()
meth public int getEndColumn()
meth public int getEndLine()
meth public int getStartColumn()
meth public int getStartLine()
meth public int hashCode()
meth public java.lang.CharSequence getCharacters()
meth public java.lang.CharSequence getCode()
 anno 0 java.lang.Deprecated()
meth public java.lang.String toString()
meth public org.graalvm.polyglot.Source getSource()
supr java.lang.Object
hfds IMPL,impl,source

CLSS public abstract org.graalvm.polyglot.TypeLiteral<%0 extends java.lang.Object>
cons protected init()
meth public final boolean equals(java.lang.Object)
meth public final int hashCode()
meth public final java.lang.Class<{org.graalvm.polyglot.TypeLiteral%0}> getRawType()
meth public final java.lang.String toString()
meth public final java.lang.reflect.Type getType()
supr java.lang.Object
hfds rawType,type

CLSS public final org.graalvm.polyglot.Value
meth public !varargs org.graalvm.polyglot.Value execute(java.lang.Object[])
meth public !varargs org.graalvm.polyglot.Value invokeMember(java.lang.String,java.lang.Object[])
meth public !varargs org.graalvm.polyglot.Value newInstance(java.lang.Object[])
meth public !varargs void executeVoid(java.lang.Object[])
meth public <%0 extends java.lang.Object> {%%0} as(java.lang.Class<{%%0}>)
meth public <%0 extends java.lang.Object> {%%0} as(org.graalvm.polyglot.TypeLiteral<{%%0}>)
meth public <%0 extends java.lang.Object> {%%0} asHostObject()
meth public <%0 extends org.graalvm.polyglot.proxy.Proxy> {%%0} asProxyObject()
meth public boolean asBoolean()
meth public boolean canExecute()
meth public boolean canInstantiate()
meth public boolean canInvokeMember(java.lang.String)
meth public boolean fitsInByte()
meth public boolean fitsInDouble()
meth public boolean fitsInFloat()
meth public boolean fitsInInt()
meth public boolean fitsInLong()
meth public boolean fitsInShort()
meth public boolean hasArrayElements()
meth public boolean hasMember(java.lang.String)
meth public boolean hasMembers()
meth public boolean isBoolean()
meth public boolean isHostObject()
meth public boolean isNativePointer()
meth public boolean isNull()
meth public boolean isNumber()
meth public boolean isProxyObject()
meth public boolean isString()
meth public boolean removeArrayElement(long)
meth public boolean removeMember(java.lang.String)
meth public byte asByte()
meth public double asDouble()
meth public float asFloat()
meth public int asInt()
meth public java.lang.String asString()
meth public java.lang.String toString()
meth public java.util.Set<java.lang.String> getMemberKeys()
meth public long asLong()
meth public long asNativePointer()
meth public long getArraySize()
meth public org.graalvm.polyglot.SourceSection getSourceLocation()
meth public org.graalvm.polyglot.Value getArrayElement(long)
meth public org.graalvm.polyglot.Value getMember(java.lang.String)
meth public org.graalvm.polyglot.Value getMetaObject()
meth public short asShort()
meth public static org.graalvm.polyglot.Value asValue(java.lang.Object)
meth public void putMember(java.lang.String,java.lang.Object)
meth public void setArrayElement(long,java.lang.Object)
supr java.lang.Object
hfds impl,receiver

CLSS public abstract interface org.graalvm.polyglot.io.ByteSequence
meth public abstract byte byteAt(int)
meth public abstract int length()
meth public byte[] toByteArray()
meth public java.util.stream.IntStream bytes()
meth public org.graalvm.polyglot.io.ByteSequence subSequence(int,int)
meth public static org.graalvm.polyglot.io.ByteSequence create(byte[])

CLSS public abstract interface org.graalvm.polyglot.io.FileSystem
meth public !varargs void copy(java.nio.file.Path,java.nio.file.Path,java.nio.file.CopyOption[]) throws java.io.IOException
meth public !varargs void createSymbolicLink(java.nio.file.Path,java.nio.file.Path,java.nio.file.attribute.FileAttribute<?>[]) throws java.io.IOException
meth public !varargs void move(java.nio.file.Path,java.nio.file.Path,java.nio.file.CopyOption[]) throws java.io.IOException
meth public !varargs void setAttribute(java.nio.file.Path,java.lang.String,java.lang.Object,java.nio.file.LinkOption[]) throws java.io.IOException
meth public abstract !varargs java.nio.channels.SeekableByteChannel newByteChannel(java.nio.file.Path,java.util.Set<? extends java.nio.file.OpenOption>,java.nio.file.attribute.FileAttribute<?>[]) throws java.io.IOException
meth public abstract !varargs java.nio.file.Path toRealPath(java.nio.file.Path,java.nio.file.LinkOption[]) throws java.io.IOException
meth public abstract !varargs java.util.Map<java.lang.String,java.lang.Object> readAttributes(java.nio.file.Path,java.lang.String,java.nio.file.LinkOption[]) throws java.io.IOException
meth public abstract !varargs void checkAccess(java.nio.file.Path,java.util.Set<? extends java.nio.file.AccessMode>,java.nio.file.LinkOption[]) throws java.io.IOException
meth public abstract !varargs void createDirectory(java.nio.file.Path,java.nio.file.attribute.FileAttribute<?>[]) throws java.io.IOException
meth public abstract java.nio.file.DirectoryStream<java.nio.file.Path> newDirectoryStream(java.nio.file.Path,java.nio.file.DirectoryStream$Filter<? super java.nio.file.Path>) throws java.io.IOException
meth public abstract java.nio.file.Path parsePath(java.lang.String)
meth public abstract java.nio.file.Path parsePath(java.net.URI)
meth public abstract java.nio.file.Path toAbsolutePath(java.nio.file.Path)
meth public abstract void delete(java.nio.file.Path) throws java.io.IOException
meth public java.lang.String getSeparator()
meth public java.nio.file.Path readSymbolicLink(java.nio.file.Path) throws java.io.IOException
meth public void createLink(java.nio.file.Path,java.nio.file.Path) throws java.io.IOException
meth public void setCurrentWorkingDirectory(java.nio.file.Path)

CLSS public abstract interface org.graalvm.polyglot.io.MessageEndpoint
meth public abstract void sendBinary(java.nio.ByteBuffer) throws java.io.IOException
meth public abstract void sendClose() throws java.io.IOException
meth public abstract void sendPing(java.nio.ByteBuffer) throws java.io.IOException
meth public abstract void sendPong(java.nio.ByteBuffer) throws java.io.IOException
meth public abstract void sendText(java.lang.String) throws java.io.IOException

CLSS public abstract interface org.graalvm.polyglot.io.MessageTransport
innr public final static VetoException
meth public abstract org.graalvm.polyglot.io.MessageEndpoint open(java.net.URI,org.graalvm.polyglot.io.MessageEndpoint) throws java.io.IOException,org.graalvm.polyglot.io.MessageTransport$VetoException

CLSS public final static org.graalvm.polyglot.io.MessageTransport$VetoException
 outer org.graalvm.polyglot.io.MessageTransport
cons public init(java.lang.String)
supr java.lang.Exception
hfds serialVersionUID

CLSS public final org.graalvm.polyglot.management.ExecutionEvent
meth public boolean isExpression()
meth public boolean isRoot()
meth public boolean isStatement()
meth public java.lang.String getRootName()
meth public java.lang.String toString()
meth public java.util.List<org.graalvm.polyglot.Value> getInputValues()
meth public org.graalvm.polyglot.PolyglotException getException()
meth public org.graalvm.polyglot.SourceSection getLocation()
meth public org.graalvm.polyglot.Value getReturnValue()
supr java.lang.Object
hfds impl

CLSS public final org.graalvm.polyglot.management.ExecutionListener
innr public final Builder
intf java.lang.AutoCloseable
meth public static org.graalvm.polyglot.management.ExecutionListener$Builder newBuilder()
meth public void close()
supr java.lang.Object
hfds EMPTY,IMPL,impl
hcls MonitoringAccessImpl

CLSS public final org.graalvm.polyglot.management.ExecutionListener$Builder
 outer org.graalvm.polyglot.management.ExecutionListener
meth public org.graalvm.polyglot.management.ExecutionListener attach(org.graalvm.polyglot.Engine)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder collectExceptions(boolean)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder collectInputValues(boolean)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder collectReturnValue(boolean)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder expressions(boolean)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder onEnter(java.util.function.Consumer<org.graalvm.polyglot.management.ExecutionEvent>)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder onReturn(java.util.function.Consumer<org.graalvm.polyglot.management.ExecutionEvent>)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder rootNameFilter(java.util.function.Predicate<java.lang.String>)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder roots(boolean)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder sourceFilter(java.util.function.Predicate<org.graalvm.polyglot.Source>)
meth public org.graalvm.polyglot.management.ExecutionListener$Builder statements(boolean)
supr java.lang.Object
hfds collectExceptions,collectInputValues,collectReturnValues,expressions,onEnter,onReturn,rootNameFilter,roots,sourceFilter,statements

CLSS public abstract interface org.graalvm.polyglot.proxy.Proxy

CLSS public abstract interface org.graalvm.polyglot.proxy.ProxyArray
intf org.graalvm.polyglot.proxy.Proxy
meth public !varargs static org.graalvm.polyglot.proxy.ProxyArray fromArray(java.lang.Object[])
meth public abstract java.lang.Object get(long)
meth public abstract long getSize()
meth public abstract void set(long,org.graalvm.polyglot.Value)
meth public boolean remove(long)
meth public static org.graalvm.polyglot.proxy.ProxyArray fromList(java.util.List<java.lang.Object>)

CLSS public abstract interface org.graalvm.polyglot.proxy.ProxyExecutable
 anno 0 java.lang.FunctionalInterface()
intf org.graalvm.polyglot.proxy.Proxy
meth public abstract !varargs java.lang.Object execute(org.graalvm.polyglot.Value[])

CLSS public abstract interface org.graalvm.polyglot.proxy.ProxyInstantiable
 anno 0 java.lang.FunctionalInterface()
intf org.graalvm.polyglot.proxy.Proxy
meth public abstract !varargs java.lang.Object newInstance(org.graalvm.polyglot.Value[])

CLSS public abstract interface org.graalvm.polyglot.proxy.ProxyNativeObject
intf org.graalvm.polyglot.proxy.Proxy
meth public abstract long asPointer()

CLSS public abstract interface org.graalvm.polyglot.proxy.ProxyObject
intf org.graalvm.polyglot.proxy.Proxy
meth public abstract boolean hasMember(java.lang.String)
meth public abstract java.lang.Object getMember(java.lang.String)
meth public abstract java.lang.Object getMemberKeys()
meth public abstract void putMember(java.lang.String,org.graalvm.polyglot.Value)
meth public boolean removeMember(java.lang.String)
meth public static org.graalvm.polyglot.proxy.ProxyObject fromMap(java.util.Map<java.lang.String,java.lang.Object>)

CLSS public abstract interface org.graalvm.polyglot.proxy.ProxyPrimitive
 anno 0 java.lang.Deprecated()
 anno 0 java.lang.FunctionalInterface()
intf org.graalvm.polyglot.proxy.Proxy
meth public abstract java.lang.Object asPrimitive()

CLSS public final org.netbeans.libs.graalsdk.GraalSDK
supr java.lang.Object

CLSS abstract interface org.netbeans.libs.graalsdk.package-info

