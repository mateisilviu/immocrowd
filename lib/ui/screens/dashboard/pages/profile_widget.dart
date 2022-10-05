import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/models/user/user.dart';

class ProfilePageWidget extends StatelessWidget {
  final UserProfile profile = UserProfile.mocked;
  final double cardHeight = 250;
  final double cardWidth = 350;

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildCardsDesktop(context));
  }

  Widget _buildCardsDesktop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildGeneralInfoCard(context),
        _buildAddressInfoCard(context),
        _buildInvestorSurveyCard(context)
      ],
    );
  }

  Widget _buildCardsMobile(BuildContext context) {
    return Column(
      children: [
        _buildGeneralInfoCard(context),
        _buildAddressInfoCard(context),
        _buildInvestorSurveyCard(context),
      ],
    );
  }

  Widget _buildGeneralInfoCard(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('General Info', textScaleFactor: 1.5),
                OutlinedButton(onPressed: () => {}, child: Text('Edit'))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'First Name :',
                ),
                Text(profile.generalInfo.firstName)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Last Name :'),
                Text(profile.generalInfo.lastName)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email address :'),
                Text(profile.generalInfo.emailAddress)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Phone number :'),
                Text(profile.generalInfo.phoneNumber)
              ],
            ),
            //Row(children: [Text('')],)
          ]),
        ),
      ),
    );
  }

  Widget _buildAddressInfoCard(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Address Info', textScaleFactor: 1.5),
                OutlinedButton(onPressed: () => {}, child: Text('Edit'))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Street :'), Text(profile.addressInfo.street)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Zip Code :'), Text(profile.addressInfo.zipCode)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('City :'), Text(profile.addressInfo.city)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('State :'), Text(profile.addressInfo.state)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Country :'), Text(profile.addressInfo.country)],
            ),
            //Row(children: [Text('')],)
          ]),
        ),
      ),
    );
  }

  Widget _buildInvestorSurveyCard(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Investor survey', textScaleFactor: 1.5),
                OutlinedButton(onPressed: () => {}, child: Text('Edit'))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Street :'), Text(profile.addressInfo.street)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Zip Code :'), Text(profile.addressInfo.zipCode)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('City :'), Text(profile.addressInfo.city)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('State :'), Text(profile.addressInfo.state)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Country :'), Text(profile.addressInfo.country)],
            ),
            //Row(children: [Text('')],)
          ]),
        ),
      ),
    );
  }
}
