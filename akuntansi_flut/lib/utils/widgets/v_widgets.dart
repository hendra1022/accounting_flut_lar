import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../v_color.dart';

class VInputText extends StatelessWidget {
  final String initialValue;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String hint;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final bool isSecureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Color? fillColor;
  final Color filledBorderColor;
  final Color hintTextColor;
  final Color textColor;
  final bool filled;
  final double textPadding;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final Function(String)? onSubmittedText;
  final Function()? onEditingComplete;
  final double? borderRadius;
  final bool autoFocus;

  const VInputText(
      {super.key,
      this.initialValue = "",
      this.textEditingController,
      this.hint = "",
      this.onSaved,
      this.focusNode,
      this.borderRadius = 10,
      this.filled = false,
      this.fillColor = VColor.primaryOpacity,
      this.textColor = VColor.grey4,
      this.hintTextColor = VColor.grey4,
      this.filledBorderColor = Colors.transparent,
      this.onChanged,
      this.isSecureText = false,
      this.validator,
      this.suffixIcon,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.prefixIcon,
      this.textCapitalization = TextCapitalization.none,
      this.textPadding = 14,
      this.onSubmittedText,
      this.onEditingComplete,
      this.maxLines = 1,
      this.autoFocus = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      readOnly: readOnly,
      textInputAction: textInputAction,
      controller: textEditingController?.text == '' ? (textEditingController?..text = initialValue) : textEditingController,
      focusNode: focusNode,
      style: TextStyle(fontFamily: interFontFamily, color: filled ? textColor : VColor.grey4),
      maxLines: maxLines,
      obscureText: isSecureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: interFontFamily,
          color: filled ? hintTextColor : VColor.grey3Opacity,
        ),
        filled: filled,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: filled ? filledBorderColor : VColor.primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: filled ? filledBorderColor : VColor.grey1Opacity,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: filled ? filledBorderColor : VColor.grey1Opacity,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: filled ? filledBorderColor : VColor.grey1Opacity,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius!),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: (textPadding),
          horizontal: (textPadding),
        ),
      ),
      textCapitalization: textCapitalization,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onSubmittedText,
      onEditingComplete: onEditingComplete,
    );
  }
}

class VInputPassword extends StatefulWidget {
  final String initialValue;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String hint;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final bool isSecureText;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;

  const VInputPassword(
      {super.key,
      this.initialValue = "",
      this.textEditingController,
      this.hint = "",
      this.onSaved,
      this.focusNode,
      this.onChanged,
      this.isSecureText = true,
      this.validator,
      this.textInputAction});

  @override
  VInputPasswordState createState() => VInputPasswordState();
}

class VInputPasswordState extends State<VInputPassword> {
  bool isSecureText = true;

  @override
  void initState() {
    isSecureText = widget.isSecureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController?.text == '' ? (widget.textEditingController?..text = widget.initialValue) : widget.textEditingController,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      style: TextStyle(
        fontFamily: interFontFamily,
        fontSize: 14.0,
      ),
      obscureText: isSecureText,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontFamily: interFontFamily,
          color: VColor.grey3,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: VColor.primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            isSecureText = !isSecureText;
            setState(() {});
          },
          icon: isSecureText
              ? const Icon(
                  Icons.visibility,
                  color: VColor.primary,
                )
              : const Icon(
                  Icons.visibility_off,
                  color: VColor.primary,
                ),
        ),
      ),
      textCapitalization: TextCapitalization.words,
      validator: widget.validator,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
    );
  }
}

class VInputOTP extends StatelessWidget {
  final String initialValue;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final String hint;
  final FormFieldSetter<String>? onSaved;
  final bool isSecureText;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool? filled;
  final Color borderColor;
  final bool last;
  final bool first;

  const VInputOTP(this.borderColor,
      {super.key,
      this.initialValue = "",
      this.textEditingController,
      this.hint = "",
      this.onSaved,
      this.focusNode,
      this.filled,
      this.fillColor,
      this.isSecureText = false,
      this.validator,
      this.suffixIcon,
      this.readOnly = false,
      this.keyboardType = TextInputType.number,
      this.textInputAction,
      this.last = false,
      this.first = false,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TextFormField(
        readOnly: readOnly,
        textInputAction: textInputAction,
        maxLines: 1,
        maxLength: 1,
        controller: textEditingController?.text == '' ? (textEditingController?..text = initialValue) : textEditingController,
        focusNode: focusNode,
        style: TextStyle(fontFamily: interFontFamily, fontSize: 27.0, fontWeight: FontWeight.bold),
        obscureText: isSecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: VColor.secondary,
              width: 10,
            ),
          ),
          prefixIcon: prefixIcon,
          hintText: hint,
          counterText: "",
          hintStyle: TextStyle(
            fontFamily: interFontFamily,
            color: VColor.grey4Opacity,
          ),
          filled: filled,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 20,
          ),
        ),
        textCapitalization: TextCapitalization.words,
        validator: validator,
        onSaved: onSaved,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}

class VLoadingPage extends StatelessWidget {
  const VLoadingPage({super.key});

  Widget _loadingPage() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(VColor.primary),
          ),
          SizedBox(
            height: 14,
          ),
          VText(
            "Please wait . . .",
            color: VColor.grey4,
            fontSize: 14,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loadingPage();
  }
}

class VNoInternetConn extends StatelessWidget {
  final VoidCallback? onPressed;
  const VNoInternetConn({super.key, required this.onPressed});
  Widget _noInternetPage() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          VSvgPicture(
            "${imagePath}no_internet.svg",
            color: VColor.black,
            width: imageSizeBack.w,
            height: imageSizeBack.w,
          ),
          const SizedBox(
            height: 14,
          ),
          const VText(
            "Koneksimu terputus :(",
            color: VColor.grey4,
            fontSize: 14,
            maxLines: 1,
          ),
          const SizedBox(
            height: 6,
          ),
          const VText(
            "Cek koneksi WiFi atau paket datamu dan coba lagi halaman ini ya",
            color: VColor.grey4,
            fontSize: 14,
            align: TextAlign.center,
          ),
          const SizedBox(
            height: 34,
          ),
          SizedBox(
            width: 160.w,
            height: 40.w,
            child: VButton(
              "Coba Lagi",
              buttonColor: VColor.secondary,
              textPadding: paddingMedium.w,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _noInternetPage();
  }
}

class VEmptyCart extends StatelessWidget {
  const VEmptyCart({super.key});

  Widget _emptyCart() {
    return Padding(
      padding: EdgeInsets.all(paddingExtraLarge),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            VSvgPicture(
              "${imagePath}no_internet.svg",
              // color: VColor.black,
              width: 128.w,
              height: 128.w,
            ),
            const SizedBox(
              height: 14,
            ),
            const VText(
              "Keranjang belanjamu kosong",
              color: VColor.grey4,
              fontSize: 14,
              maxLines: 1,
            ),
            const SizedBox(
              height: 6,
            ),
            const VText(
              "Ayo, isi dengan produk-produk keinginanamu!",
              color: VColor.grey4,
              fontSize: 14,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _emptyCart();
  }
}

class VAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> action;
  final bool isCenter;
  final bool isLightTheme;
  final double elevation;

  const VAppBar(this.title, {super.key, this.action = const [], this.isCenter = true, this.isLightTheme = true, this.elevation = 0.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      centerTitle: isCenter,
      backgroundColor: isLightTheme ? VColor.white : VColor.primary,
      titleTextStyle: TextStyle(
        color: isLightTheme ? VColor.black : VColor.white,
      ),
      title: VText(
        title,
        isBold: true,
        fontSize: 17.0,
        color: isLightTheme ? VColor.black : VColor.white,
      ),
      leadingWidth: 32.0,
      iconTheme: IconThemeData(color: isLightTheme ? VColor.black : VColor.white),
      actions: action,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

TextSpan vTextSpan(
    {String text = "",
    bool isBold = false,
    TextDecoration? decoration,
    Color color = VColor.grey4,
    GestureRecognizer? recognizer,
    List<InlineSpan>? children,
    double fontSize = 14.0}) {
  return TextSpan(
      text: text,
      style: TextStyle(
          fontFamily: interFontFamily, fontWeight: !isBold ? FontWeight.normal : FontWeight.bold, color: color, decoration: decoration, fontSize: fontSize),
      recognizer: recognizer,
      children: children);
}

class VTextRich extends StatelessWidget {
  final InlineSpan? textSpan;
  final Color? color;
  final double? fontSize;
  final TextDecoration? decoration;
  final bool isBold;

  const VTextRich({super.key, this.textSpan, this.color, this.fontSize, this.decoration, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textSpan!,
      style: TextStyle(
        fontFamily: interFontFamily,
        color: color,
        fontSize: fontSize,
        fontWeight: !isBold ? FontWeight.normal : FontWeight.bold,
        decoration: decoration,
      ),
    );
  }
}

class VText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextAlign? align;
  final bool? money;
  final TextDecoration? decoration;
  final int? maxLines;
  final Color? color;
  final bool? isBold;
  final VoidCallback? onPressed;

  const VText(this.title,
      {super.key,
      this.fontSize,
      this.overflow,
      this.money = false,
      this.onPressed,
      this.decoration,
      this.maxLines,
      this.align,
      this.color = VColor.black,
      this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        money! ? title!.currency : title!,
        style: TextStyle(
          fontFamily: interFontFamily,
          color: color,
          fontSize: fontSize,
          fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
          decoration: decoration,
        ),
        overflow: overflow,
        textAlign: align,
        maxLines: maxLines,
      ),
    );
  }
}

class VTextShadow extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextAlign? align;
  final bool? money;
  final TextDecoration? decoration;
  final int? maxLines;
  final Color? color;
  final bool? isBold;
  final VoidCallback? onPressed;

  const VTextShadow(this.title,
      {super.key,
      this.fontSize,
      this.overflow,
      this.money = false,
      this.onPressed,
      this.decoration,
      this.maxLines,
      this.align,
      this.color = VColor.black,
      this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        money! ? title!.currency : title!,
        style: TextStyle(
          fontFamily: interFontFamily,
          color: color,
          fontSize: fontSize,
          fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
          decoration: decoration,
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
        overflow: overflow,
        textAlign: align,
        maxLines: maxLines,
      ),
    );
  }
}

class VButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color textColorDisabled;
  final Color buttonColor;
  final Color buttonColorDisabled;
  final VoidCallback? onPressed;
  final bool disabled;
  final double textPadding;
  final double borderRadius;

  const VButton(
    this.title, {
    super.key,
    this.textColor = VColor.white,
    this.textColorDisabled = VColor.grey1,
    this.buttonColor = VColor.primary,
    this.buttonColorDisabled = VColor.primaryOpacity,
    @required this.onPressed,
    this.disabled = false,
    this.textPadding = 24,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(textPadding)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            !disabled ? buttonColor : buttonColorDisabled,
          ),
        ),
        child: VText(
          title,
          isBold: true,
          color: !disabled ? textColor : textColorDisabled,
        ),
      ),
    );
  }
}

class VButtonBorder extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color textColorDisabled;
  final Color buttonColor;
  final Color buttonColorDisabled;
  final Color borderColor;
  final VoidCallback? onPressed;
  final bool disabled;
  final double textPadding;
  final double borderRadius;

  const VButtonBorder(
    this.title, {
    super.key,
    this.textColor = VColor.white,
    this.textColorDisabled = VColor.grey1,
    this.buttonColor = VColor.primary,
    this.buttonColorDisabled = VColor.primaryOpacity,
    this.borderColor = VColor.primary,
    @required this.onPressed,
    this.disabled = false,
    this.textPadding = 24,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(textPadding)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              side: BorderSide(color: borderColor, width: 0.5, style: BorderStyle.solid), borderRadius: BorderRadius.circular(borderRadius))),
          backgroundColor: MaterialStateProperty.all<Color>(
            !disabled ? buttonColor : buttonColorDisabled,
          ),
        ),
        child: VText(
          title,
          isBold: true,
          color: !disabled ? textColor : textColorDisabled,
        ),
      ),
    );
  }
}

class VButtonIcon extends StatelessWidget {
  final String title, imgPath;
  final double iconSize;
  final Color textColor, textColorDisabled, buttonColor, buttonColorDisabled;
  final VoidCallback? onPressed;
  final bool disabled;

  const VButtonIcon(this.title,
      {super.key,
      this.imgPath = "assets/images/logo_float.svg",
      this.iconSize = 40,
      this.textColor = VColor.white,
      this.textColorDisabled = VColor.grey1,
      this.buttonColor = VColor.primary,
      this.buttonColorDisabled = VColor.primaryOpacity,
      @required this.onPressed,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          disabledBackgroundColor: buttonColorDisabled,
          foregroundColor: textColor,
          disabledForegroundColor: textColorDisabled,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          padding: const EdgeInsets.all(14.0),
        ),
        child: Row(
          // Replace with a Row for horizontal icon + text
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            VSvgPicture(imagePath + imgPath, height: iconSize, width: iconSize),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class VButtonIconBorder extends StatelessWidget {
  final String title, imgPath;
  final Color textColor, textColorDisabled, buttonColor, buttonColorDisabled;
  final VoidCallback? onPressed;
  final Color borderColor;
  final Color iconColor;
  final bool disabled;
  final double? iconSize;
  final double? padding;

  const VButtonIconBorder(this.title,
      {super.key,
      this.imgPath = "assets/images/logo_float.svg",
      this.iconSize = 40.0,
      this.padding = 14.0,
      this.textColor = VColor.white,
      this.textColorDisabled = VColor.grey1,
      this.buttonColor = VColor.primary,
      this.borderColor = VColor.primary,
      this.iconColor = VColor.white,
      this.buttonColorDisabled = VColor.primaryOpacity,
      @required this.onPressed,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          disabledBackgroundColor: buttonColorDisabled,
          foregroundColor: textColor,
          disabledForegroundColor: textColorDisabled,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: borderColor, width: 0.5, style: BorderStyle.solid),
          ),
          padding: EdgeInsets.all(padding!),
        ),
        child: Row(
          // Replace with a Row for horizontal icon + text
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            VSvgPicture(
              imagePath + imgPath,
              height: iconSize,
              width: iconSize,
              color: iconColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class VCircleIconButton extends StatelessWidget {
  final String imgPath;
  final double iconSize;
  final Color buttonColor, buttonColorDisabled, iconColor;
  final VoidCallback? onPressed;
  final bool disabled;
  final double padding;

  const VCircleIconButton(
      {super.key,
      this.imgPath = "assets/images/logo_float.svg",
      this.iconSize = 40,
      this.padding = 10,
      this.iconColor = VColor.white,
      this.buttonColor = VColor.primary,
      this.buttonColorDisabled = VColor.primaryOpacity,
      @required this.onPressed,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          disabledBackgroundColor: buttonColorDisabled,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap, //limits the touch area to the button area
          minimumSize: const Size(0, 0), //wraps child's height
          shape: const CircleBorder(),
          padding: EdgeInsets.all(padding),
        ),
        child: VSvgPicture(imagePath + imgPath, color: iconColor, height: iconSize, width: iconSize),
      ),
    );
  }
}

class VCircleIconButtonWithBadge extends StatelessWidget {
  final String imgPath;
  final double iconSize;
  final Color buttonColor, buttonColorDisabled, iconColor;
  final VoidCallback? onPressed;
  final bool disabled;
  final double padding;
  final int total;

  const VCircleIconButtonWithBadge(
      {super.key,
      this.imgPath = "assets/images/logo_float.svg",
      this.iconSize = 40,
      this.padding = 10,
      this.iconColor = VColor.white,
      this.buttonColor = VColor.primary,
      this.buttonColorDisabled = VColor.primaryOpacity,
      @required this.onPressed,
      this.disabled = false,
      this.total = 0});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              disabledBackgroundColor: buttonColorDisabled,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //limits the touch area to the button area
              minimumSize: const Size(0, 0),
              shape: const CircleBorder(),
              padding: EdgeInsets.all(padding),
            ),
            child: VSvgPicture(imagePath + imgPath, color: iconColor, height: iconSize, width: iconSize),
          ),
          Positioned(
            top: 0.0,
            right: 4.0,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: VColor.orange,
                shape: BoxShape.circle,
              ),
              child: VText(
                "$total",
                color: Colors.white,
                fontSize: 12.0,
                isBold: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight extends SliverGridDelegate {
  /// Creates a delegate that makes grid layouts with a fixed number of tiles in
  /// the cross axis.
  ///
  /// All of the arguments must not be null. The `mainAxisSpacing` and
  /// `crossAxisSpacing` arguments must not be negative. The `crossAxisCount`
  /// and `childAspectRatio` arguments must be greater than zero.
  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    @required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.height = 56.0,
  })  : assert(crossAxisCount != null && crossAxisCount > 0),
        assert(mainAxisSpacing != null && mainAxisSpacing >= 0),
        assert(crossAxisSpacing != null && crossAxisSpacing >= 0),
        assert(height != null && height > 0);

  /// The number of children in the cross axis.
  final int? crossAxisCount;

  /// The number of logical pixels between each child along the main axis.
  final double? mainAxisSpacing;

  /// The number of logical pixels between each child along the cross axis.
  final double? crossAxisSpacing;

  /// The height of the crossAxis.
  final double? height;

  bool _debugAssertIsValid() {
    assert(crossAxisCount! > 0);
    assert(mainAxisSpacing! >= 0.0);
    assert(crossAxisSpacing! >= 0.0);
    assert(height! > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final double usableCrossAxisExtent = constraints.crossAxisExtent - crossAxisSpacing! * (crossAxisCount! - 1);
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount!;
    final double childMainAxisExtent = height!;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount!,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing!,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing!,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
    return oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.height != height;
  }
}

// class VCachedNetworkImage extends StatelessWidget {
//   final String url;
//   final double height;
//   final double width;
//   final Widget placeholder;

//   const VCachedNetworkImage(this.url,
//       {this.height = 40.0,
//       this.width = 40.0,
//       this.placeholder = const Icon(
//         Icons.dangerous,
//         color: VColor.primary,
//       )});

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       imageUrl: url,
//       height: height,
//       width: width,
//       fit: BoxFit.fitWidth,
//       errorWidget: (c, s, d) => placeholder,
//       placeholder: (c, s) => placeholder,
//     );
//   }
// }

class VLoadingItem extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const VLoadingItem({
    super.key,
    this.height = 100.0,
    this.width = double.infinity,
    this.color = VColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: color.withOpacity(0.3),
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}

class VMessageItem extends StatelessWidget {
  final String message;
  final double height;
  final double width;
  final VoidCallback? action;

  const VMessageItem({
    super.key,
    this.height = 100.0,
    this.width = double.infinity,
    this.message = "Data is empty",
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VText(
            message.isEmpty ? "Data is Empty" : message,
          ),
          if (action != null) ...refreshButton()
        ],
      ),
    );
  }

  List<Widget> refreshButton() {
    return [
      const SizedBox(
        height: 8.0,
      ),
      VButton(
        "Refresh",
        onPressed: action,
      ),
    ];
  }
}

class VBoxShadow extends StatelessWidget {
  final Widget? child;
  final Color color;
  final double borderRadius;

  const VBoxShadow({super.key, @required this.child, this.color = Colors.white, this.borderRadius = 12.0});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: color,
      shadowColor: Colors.black.withOpacity(0.3),
      elevation: 10,
      borderRadius: BorderRadius.circular(borderRadius),
      child: child,
    );
  }
}

// class VToast {
//   static show([String message = ""]) {
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: VColor.grey2,
//         textColor: Colors.black,
//         fontSize: 16.0);
//   }
// }

class VIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double size;
  final Color colorBackground;
  final Color colorIcon;

  const VIconButton(
    this.icon, {
    super.key,
    this.onPressed,
    this.size = 20.0,
    this.colorBackground = VColor.primary,
    this.colorIcon = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        color: colorIcon,
        size: size,
      ),
      color: colorBackground,
    );
  }
}

class VIconButtonWithBadge extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final int total;

  const VIconButtonWithBadge({super.key, this.onPressed, this.icon = Icons.shopping_cart, this.total = 0});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Stack(
        fit: StackFit.expand,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Positioned(
            top: 0.0,
            right: 4.0,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: VColor.orange,
                shape: BoxShape.circle,
              ),
              child: VText(
                "$total",
                color: Colors.white,
                fontSize: 12.0,
                isBold: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VSvgPicture extends StatelessWidget {
  final String img;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback? onPressed;

  const VSvgPicture(this.img, {super.key, this.color, this.height, this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SvgPicture.asset(
        img,
        width: width,
        height: height,
        color: color,
        placeholderBuilder: (BuildContext context) {
          return const Icon(
            Icons.error,
            color: VColor.primary,
          );
        },
      ),
    );
  }
}

class VBackground extends StatelessWidget {
  final Widget child;
  final String background;
  final Widget? footer;

  const VBackground({super.key, required this.child, this.background = "background.png", this.footer});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -40.0,
          left: 0.0,
          right: 0.0,
          child: Image.asset(
            imagePath + background,
            fit: BoxFit.fitWidth,
          ),
        ),
        child,
        if (footer != null) footer!
      ],
    );
  }
}

class VCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final double height;
  final double width;
  const VCheckbox({
    super.key,
    this.isChecked = false,
    required this.onChanged,
    this.height = 18,
    this.width = 18,
  });

  @override
  VCheckboxState createState() => VCheckboxState();
}

class VCheckboxState extends State<VCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Checkbox(
        value: isChecked,
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.all(VColor.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onChanged: (bool? value) {
          widget.onChanged(value!);
          isChecked = value;
        },
      ),
    );
  }
}

class VExpansionTile extends StatefulWidget {
  const VExpansionTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
  })  : assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          'CrossAxisAlignment.baseline is not supported since the expanded children '
          'are aligned in a column, not a row. Try to use another constant.',
        ),
        super(key: key);

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final Widget? trailing;

  final bool initiallyExpanded;
  final bool maintainState;
  final EdgeInsetsGeometry? tilePadding;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final EdgeInsetsGeometry? childrenPadding;
  final Color? iconColor;
  final Color? collapsedIconColor;
  final Color? textColor;
  final Color? collapsedTextColor;

  @override
  ExpansionTileState createState() => ExpansionTileState();
}

class ExpansionTileState extends State<VExpansionTile> with SingleTickerProviderStateMixin {
  static const Duration _kExpand = Duration(milliseconds: 200);

  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _borderColor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value,
            textColor: _headerColor.value,
            child: ListTile(
              onTap: _handleTap,
              contentPadding: widget.tilePadding,
              leading: widget.leading,
              title: widget.title,
              subtitle: widget.subtitle,
              trailing: widget.trailing ??
                  RotationTransition(
                    turns: _iconTurns,
                    child: const Icon(Icons.expand_more),
                  ),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = widget.collapsedTextColor ?? theme.textTheme.subtitle1!.color
      ..end = widget.textColor ?? colorScheme.secondary;
    _iconColorTween
      ..begin = widget.collapsedIconColor ?? theme.unselectedWidgetColor
      ..end = widget.iconColor ?? colorScheme.secondary;
    _backgroundColorTween
      ..begin = widget.collapsedBackgroundColor
      ..end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.childrenPadding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
