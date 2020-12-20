/*
 * MIT License
 *
 * Copyright (c) 2020 Rizky Andhika Putra
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
extension ZeroLeading on String {
  String zeroLead() {
    return (int.tryParse(this) <= 9) ? "0$this" : this;
  }
}

/// Convert value to "Rp XX.XXX.XXX" as [String]
String rupiah(value, {String separator='.', String trailing=''}) {
	return "Rp " + value.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}${separator}') + trailing;
}

/// Convert [DateTime] to Indonesia specific date
String tanggal(DateTime date, {bool shortMonth=false}) {
  if (date == null)
    return "";
	return "${date.day} ${_convertToLocalMonth(date.month, shortMonth)} ${date.year}";
}

List _longMonth = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
List _shortMonth = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];

String _convertToLocalMonth(int month, bool shortMonth) {
	if (shortMonth) return _shortMonth[month -1];
	return _longMonth[month - 1];
}

/// Get Only Month Name from [DateTime]
String bulan(DateTime date) {
  return _convertToLocalMonth(date.month, false);
}

/// Reformat indonesian phone number 0 to +62
String phoneFormat(String phone) {
  if (phone == null || phone.isEmpty) return "";
  var first = phone[0];
  final number = phone.substring(1);
  if (first == "0") 
    first = "+62";
  return "$first$number";
}