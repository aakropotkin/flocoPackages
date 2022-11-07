{

  inputs.packument.url   = "https://registry.npmjs.org/dom-helpers?rev=66-361a4681251d286e2327438dd29d4e65";
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
    ident = "dom-helpers";
    ldir  = "info/unscoped/d/dom-helpers";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
