{

  inputs.packument.url   = "https://registry.npmjs.org/@lumino/messaging?rev=38-0e21a279a49a77a677f4b5a589c93a89";
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
    scope = "@lumino";
    ident = "@lumino/messaging";
    ldir  = "info/lumino/messaging";
    inherit packument fetchInfo;
  } // latest';

}
