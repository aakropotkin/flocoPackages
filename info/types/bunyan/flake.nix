{

  inputs.packument.url   = "https://registry.npmjs.org/@types/bunyan?rev=634-dd73f94d260b252066e15e937963d91d";
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
    ident = "@types/bunyan";
    ldir  = "info/types/bunyan";
    inherit packument fetchInfo;
  } // latest';

}
