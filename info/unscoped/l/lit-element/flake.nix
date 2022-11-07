{

  inputs.packument.url   = "https://registry.npmjs.org/lit-element?rev=117-d16ec54d47b36449d942bc7a65ae7162";
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
    ident = "lit-element";
    ldir  = "info/unscoped/l/lit-element";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
