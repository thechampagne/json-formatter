/*
 * Copyright (c) 2022 XXIV
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import std.file: readText, write;
import std.stdio: writeln;
import std.json: JSONValue, parseJSON;
import core.stdc.stdlib : exit;
import std.format;

bool indexExists(string[] array, int index)
{
	return index >= 0 && index < array.length;
}

void formatter(string fileName)
{
	try
	{
		auto content = readText(format("%s.json", fileName));
		JSONValue json = parseJSON(content);
		write(format("%s.json", fileName), json.toPrettyString);
	} catch(Exception ex)
	{
		writeln(format("Something went wrong: %s",ex.msg));
	}
}

void main(string[] args)
{
	if (!indexExists(args, 1))
	{
		writeln("Usage: formatter file-name");
		exit(1);
	}
	formatter(args[1]);
}