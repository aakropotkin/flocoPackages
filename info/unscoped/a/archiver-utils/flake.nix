{

  inputs.packument.url   = "https://registry.npmjs.org/archiver-utils?rev=13-815b99213089934877605cba016e4f25";
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
    ident = "archiver-utils";
    ldir  = "info/unscoped/a/archiver-utils";
    inherit packument fetchInfo;
  } // latest';

}
