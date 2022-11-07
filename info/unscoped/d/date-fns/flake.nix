{

  inputs.packument.url   = "https://registry.npmjs.org/date-fns?rev=266-488e196516ef907a4968e675d5947d0c";
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
    scope = null;
    ident = "date-fns";
    ldir  = "info/unscoped/d/date-fns";
    inherit packument fetchInfo;
  } // latest';

}
