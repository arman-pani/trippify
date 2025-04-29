import json
import re
from datetime import datetime

from bs4 import BeautifulSoup


class Prettify:

    def between_station(self, string):
        try:
            retval = {}
            arr = []
            data = string.split("~~~~~~~~")
            nore = data[0].split("~")[5].split("<")

            if nore[0] == "No direct trains found":
                retval["success"] = False
                retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
                retval["data"] = nore[0]
                return retval

            if data[0] in [
                "~~~~~Please try again after some time.",
                "~~~~~From station not found",
                "~~~~~To station not found"
            ]:
                retval["success"] = False
                retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
                retval["data"] = data[0].replace("~", "")
                return retval

            data = [el for el in data if el]

            for entry in data:
                parts = entry.split("~^")
                if len(parts) == 2:
                    fields = [el for el in parts[1].split("~") if el]
                    obj = {
                        "train_no": fields[0],
                        "train_name": fields[1],
                        "source_stn_name": fields[2],
                        "source_stn_code": fields[3],
                        "dstn_stn_name": fields[4],
                        "dstn_stn_code": fields[5],
                        "from_stn_name": fields[6],
                        "from_stn_code": fields[7],
                        "to_stn_name": fields[8],
                        "to_stn_code": fields[9],
                        "from_time": fields[10],
                        "to_time": fields[11],
                        "travel_time": fields[12],
                        "running_days": fields[13],
                    }
                    arr.append({"train_base": obj})

            retval["success"] = True
            retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
            retval["data"] = arr
            return retval

        except Exception as err:
            print(f"Error: {err}")

    def get_day_on_date(self, DD, MM, YYYY):
        date = datetime(YYYY, MM, DD)
        day = (date.weekday() + 1) % 7  # weekday(): 0-Monday
        return day

    def get_route(self, string):
        try:
            retval = {}
            arr = []
            entries = string.split("~^")

            for entry in entries:
                fields = [el for el in entry.split("~") if el]
                obj = {
                    "source_stn_name": fields[2],
                    "source_stn_code": fields[1],
                    "arrive": fields[3],
                    "depart": fields[4],
                    "distance": fields[6],
                    "day": fields[7],
                    "zone": fields[9],
                }
                arr.append(obj)

            retval["success"] = True
            retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
            retval["data"] = arr
            return retval

        except Exception as err:
            print(f"Error: {err}")

    def live_station(self, html_string):
        retval = {}
        arr = []
        soup = BeautifulSoup(html_string, "html.parser")

        for el in soup.select('.name'):
            obj = {
                "train_no": el.text[:5],
                "train_name": el.text[5:].strip(),
                "source_stn_name": el.find_next("div").text.split("\u2192")[0].strip(),
                "dstn_stn_name": el.find_next("div").text.split("\u2192")[1].strip(),
                "time_at": el.parent.find_next("td").text[:5],
                "detail": el.parent.find_next("td").text[5:],
            }
            arr.append(obj)

        retval["success"] = True
        retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
        retval["data"] = arr
        return retval

    def pnr_status(self, string):
        retval = {}
        match = re.search(r"data\s*=\s*({.*?;)", string)

        if match:
            json_text = match.group(1)[:-1]
            data = json.loads(json_text)
            retval["success"] = True
            retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
            retval["data"] = data
        else:
            retval["success"] = False
            retval["error"] = "PNR data not found"

        return retval

    def check_train(self, string):
        try:
            retval = {}
            data = string.split("~~~~~~~~")

            if data[0] in ["~~~~~Please try again after some time.", "~~~~~Train not found"]:
                retval["success"] = False
                retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
                retval["data"] = data[0].replace("~", "")
                return retval

            fields = [el for el in data[0].split("~") if el]
            if len(fields[1]) > 6:
                fields.pop(0)

            obj = {
                "train_no": fields[1].replace("^", ""),
                "train_name": fields[2],
                "from_stn_name": fields[3],
                "from_stn_code": fields[4],
                "to_stn_name": fields[5],
                "to_stn_code": fields[6],
                "from_time": fields[11],
                "to_time": fields[12],
                "travel_time": fields[13],
                "running_days": fields[14],
            }

            fields2 = [el for el in data[1].split("~") if el]

            obj.update({
                "type": fields2[11],
                "train_id": fields2[12],
                "distance_from_to": fields2[18],
                "average_speed": fields2[19],
            })

            retval["success"] = True
            retval["time_stamp"] = int(datetime.now().timestamp() * 1000)
            retval["data"] = obj
            return retval

        except Exception as err:
            print(f"Error: {err}")
