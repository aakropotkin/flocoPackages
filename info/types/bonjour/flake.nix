{

  inputs.packument.url   = "https://registry.npmjs.org/@types/bonjour?rev=619-164bae329c6c26dec6b92daf46d271a5";
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
    scope = "@types";
    ident = "@types/bonjour";
    ldir  = "info/types/bonjour";
    inherit packument fetchInfo;
  } // latest';

}
