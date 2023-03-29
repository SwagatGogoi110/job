import 'package:flutter/material.dart';
import 'package:jobfind/models/job.dart';
import 'package:jobfind/screens/home/widgets/job_detail.dart';
import 'package:jobfind/screens/home/widgets/job_item.dart';

class JobList extends StatelessWidget {
  final jobList = Job.generateJobs();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 35),
      height: 190,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => JobDetails(jobList[index]));
          },
          child: JobItem(jobList[index]),
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: 15,
        ),
        itemCount: jobList.length,
      ),
    );
  }
}
