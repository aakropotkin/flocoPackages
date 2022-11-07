{

  inputs.packument.url   = "https://registry.npmjs.org/workerpool?rev=60-058e4c5e49a9041c299a4abdda930fbf";
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
    ident = "workerpool";
    ldir  = "info/unscoped/w/workerpool";
    inherit packument fetchInfo;
  } // latest';

}
