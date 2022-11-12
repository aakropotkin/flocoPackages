{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@blueprintjs%2fpopover2?_rev=91-88d5ef9fe11440d75fb7ecbcd4d6a8f8";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = "@blueprintjs";
    ident = "@blueprintjs/popover2";
    ldir  = "info/blueprintjs/popover2";
    inherit packument fetchInfo;
  } // latest';

}
