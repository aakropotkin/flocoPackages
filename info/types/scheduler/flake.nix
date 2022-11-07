{

  inputs.packument.url   = "https://registry.npmjs.org/@types/scheduler?rev=388-7079ba8878886bf3a0c4b53f81a1b75f";
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
    ident = "@types/scheduler";
    ldir  = "info/types/scheduler";
    inherit packument fetchInfo;
  } // latest';

}
